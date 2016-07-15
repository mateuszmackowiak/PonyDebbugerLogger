PonyDebuggerLogger
================

A bridge between [CocoaLumberjack](https://github.com/robbiehanson/CocoaLumberjack) and [PonyDebugger](https://github.com/square/PonyDebugger).


## Usage

#### AppDelegate.h

```ObjC
#import "PonyDebuggerLogger.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    PDDebugger * debugger = [PDDebugger defaultInstance];   
    [debugger connectToURL:[NSURL URLWithString:@"ws://localhost:9000/device"]];
    [debugger enableRemoteLogging];
    [DDLog addLogger:[PonyDebuggerLogger sharedInstance]];

    DDLogError(@"YAhoo");
}

```

## Installation

I recommended to use [CocoaPods](http://cocoapods.org/) as a way to get the library.

Here's an example podfile that installs PonyDebuggerLogger and its dependencies

### Podfile

```bash

pod 'PonyDebuggerLogger'

```