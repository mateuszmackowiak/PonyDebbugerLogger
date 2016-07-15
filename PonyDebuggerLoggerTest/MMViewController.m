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
	DDLogError(@"viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)errorButtonTapped:(id)sender {
    DDLogError(@"Error button tapped");
}

- (IBAction)infoButtonTapped:(id)sender {
    DDLogInfo(@"Info button tapped");
}


- (IBAction)debugButtonTapped:(id)sender {
    DDLogVerbose(@"Debug button tapped");
}

- (IBAction)warnButtonTapped:(id)sender {
    DDLogWarn(@"Warning button tapped");
}

@end
