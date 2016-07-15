//
//  Created by Mateusz Mackowiak on 20.08.2013.
//  Copyright (c) 2013 MateuszMackowiak. All rights reserved.
//

#import "PonyDebuggerLogger.h"
#import <PonyDebugger/PDConsoleDomainController.h>

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
    NSString * logMsg = logMessage.message;
    
    if (_logFormatter) {
        logMsg = [_logFormatter formatLogMessage:logMessage];
    }
    if (logMsg) {
        DDLogFlag flag = logMessage.flag;
        NSString* severity = [self logMessageTypeToString:flag];
        [self.consoleDomainController logWithArguments:@[logMsg] severity:severity];
    }
}

- (NSString *) loggerName {
    return @"pl.mateuszmackowiak.ponydebuggerlogger";
}


- (NSString *) logMessageTypeToString:(DDLogFlag)type {
    switch (type) {
        case DDLogFlagError:
            return @"error";
        case DDLogFlagWarning:
            return @"warn";
        case DDLogFlagInfo:
            return @"info";
        default:
            return @"debug";
    }
}

@end

