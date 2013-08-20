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

@implementation PonyDebuggerLogger

static PonyDebuggerLogger * sharedInstance;

+ (void) initialize {
    static BOOL initialized = NO;
    
    if (!initialized) {
        initialized = YES;
        
        sharedInstance = [[self alloc] init];
        
    }
}

+ (id) sharedInstance {
    return sharedInstance;
}

- (id) init {
    if (sharedInstance != nil) {
        return nil;
    }
    
    if (self = [super init]) {
        
    }
    return self;
}

- (void) logMessage:(DDLogMessage *)logMessage {
    NSString * logMsg = logMessage->logMsg;
    
    if (formatter)
        logMsg = [formatter formatLogMessage:logMessage];
    
    if (logMsg) {
        int flag = logMessage->logFlag;
        [[PDConsoleDomainController defaultInstance] logWithArguments:@[logMsg]
                                                             severity:[PonyDebuggerLogger logMessageTypeToString:flag]];
    }
}

- (NSString *) loggerName {
    return @"pl.mateuszmackowiak.ponydebuggerlogger";
}


+ (NSString *) logMessageTypeToString:(int)type {
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

