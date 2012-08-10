//
//  QTKBlackViewController.m
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/10/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import "QTKBlackViewController.h"

@interface QTKBlackViewController ()
@property (nonatomic, assign) int selectedTopNavTabIndex;
@end

@implementation QTKBlackViewController
@synthesize topNavContainerView;
@synthesize topNavViewControllers;

- (id)init{
   
    return [self initWithNibName:@"QTKBlackViewController" bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.topNavTabItems = [NSArray arrayWithObjects:@"Swimming",@"Gymnastics",@"Track n Field",nil];
    /*for(int index = 0; index < [self.topNavTabItems count]; index ++){
      UIViewController *topNavTabItem = [[UIViewController alloc]init];
    }*/
    
    UIViewController *topNavContainerOneController = [[UIViewController alloc]init];
    [topNavContainerOneController.view setBackgroundColor:[UIColor whiteColor]];
    [self addChildViewController:topNavContainerOneController];
    [self.topNavViewControllers  addObject:topNavContainerOneController];
    

    UIViewController *topNavContainerTwoController = [[UIViewController alloc]init];
    [topNavContainerTwoController.view setBackgroundColor:[UIColor cyanColor]];
    [self addChildViewController:topNavContainerTwoController];
    [self.topNavViewControllers addObject:topNavContainerTwoController];
    
    UIViewController *topNavContainerThreeController = [[UIViewController alloc]init];
    [topNavContainerThreeController.view setBackgroundColor:[UIColor darkGrayColor]];
    [self addChildViewController:topNavContainerThreeController];
    [self.topNavViewControllers addObject:topNavContainerThreeController];
    
    self.selectedTopNavTabIndex = 0;
    self.topNavContainerView = topNavContainerOneController.view;
    topNavContainerOneController.view.frame = self.topNavContainerView.bounds;
    
}

- (void)viewDidUnload
{
    [self setTopNavContainerView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)btnSwimmingTapped:(id)sender {
}
@end
