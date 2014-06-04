//
//  PonyDebuggerLogger.m
//  PonyDebuggerLoggerTest
//
//  Created by Mateusz Mackowiak on 20.08.2013.
//  Copyright (c) 2013 MateuszMackowiak. All rights reserved.
//

#import "PonyDebuggerLogger.h"
#import "PDConsoleDomainController.h"

#if !__has_feature(objc_arc)
#warning This file must be compiled with ARC. Use -fobjc-arc flag (or convert project to ARC).
#endif

@interface PonyDebuggerLogger ()
@property (nonatomic, strong) PDConsoleDomainController* consoleDomainController;
@end

@implementation PonyDebuggerLogger

+ (instancetype) sharedInstance {
    static PonyDebuggerLogger *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.consoleDomainController = [PDConsoleDomainController defaultInstance];
    }
    return self;
}

- (void) logMessage:(DDLogMessage *)logMessage {
    NSString * logMsg = logMessage->logMsg;
    
    if (formatter)
        logMsg = [formatter formatLogMessage:logMessage];
    
    if (logMsg) {
        int flag = logMessage->logFlag;
        NSString* severity = [self logMessageTypeToString:flag];
        [self.consoleDomainController logWithArguments:@[logMsg] severity:severity];
    }
}

- (NSString *) loggerName {
    return @"pl.mateuszmackowiak.ponydebuggerlogger";
}


- (NSString *) logMessageTypeToString:(int)type {
    switch (type) {
        case LOG_FLAG_ERROR:
            return @"error";
        case LOG_FLAG_WARN:
            return @"warn";
        case LOG_FLAG_INFO:
            return @"info";
        default:
            return @"debug";
    }
}

@end

