//
//  MMViewController.m
//  PonyDebuggerLoggerTest
//
//  Created by Mateusz Mackowiak on 20.08.2013.
//  Copyright (c) 2013 MateuszMackowiak. All rights reserved.
//

#import "MMViewController.h"

@interface MMViewController ()

@end

@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	DDLogCError(@"YAhoo");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)errorButtonTapped:(id)sender {
    DDLogCError(@"Error button tapped");
}

- (IBAction)infoButtonTapped:(id)sender {
    DDLogCInfo(@"Info button tapped");
}


- (IBAction)debugButtonTapped:(id)sender {
    DDLogCVerbose(@"Debug button tapped");
}

- (IBAction)warnButtonTapped:(id)sender {
    DDLogCWarn(@"Warning button tapped");
}

@end
