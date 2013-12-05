//
//  ViewController.m
//  CircleProgressDemo
//
//  Created by andy on 12/5/13.
//  Copyright (c) 2013 AM Studio. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize circleButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.circleButton = [[CircleProgressView alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 30, 30)];
    [self.view addSubview:circleButton];
    
    [self.circleButton update:50];
}

@end
