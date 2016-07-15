//
//  Created by Mateusz Mackowiak on 20.08.2013.
//  Copyright (c) 2013 MateuszMackowiak. All rights reserved.
//

#import "DDLog.h"
@class PDConsoleDomainController;

@interface PonyDebuggerLogger : DDAbstractLogger

@property (nonatomic, strong) PDConsoleDomainController* consoleDomainController;

+ (instancetype) sharedInstance;

@end
