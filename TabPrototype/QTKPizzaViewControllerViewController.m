//
//  QTKPizzaViewControllerViewController.m
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/27/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import "QTKPizzaViewControllerViewController.h"

@interface QTKPizzaViewControllerViewController ()

@end

@implementation QTKPizzaViewControllerViewController

@synthesize detailView;
@synthesize navigationView;
@synthesize containerView;

- (id)init{
    return [self initWithNibName:@"QTKPizzaViewController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [self setDetailView:nil];
    [self setNavigationView:nil];
    [self setContainerView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
	return YES;
}

@end
