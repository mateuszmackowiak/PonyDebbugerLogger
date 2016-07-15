//
//  MMAppDelegate.m
//  PonyDebuggerLoggerTest
//
//  Created by Mateusz Mackowiak on 20.08.2013.
//  Copyright (c) 2013 MateuszMackowiak. All rights reserved.
//

#import "MMAppDelegate.h"
#import "DDTTYLogger.h"
#import "PDDebugger.h"
#import "PonyDebuggerLogger.h"

@implementation MMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupLogger];
    return YES;
}


-(void)setupLogger {
    PDDebugger * debugger = [PDDebugger defaultInstance];
    
    [debugger connectToURL:[NSURL URLWithString:@"ws://localhost:9000/device"]];
    [debugger enableNetworkTrafficDebugging];
    [debugger enableViewHierarchyDebugging];
    [debugger enableRemoteLogging];
    [debugger forwardAllNetworkTraffic];
    
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [DDLog addLogger:[PonyDebuggerLogger sharedInstance]];
}



@end
