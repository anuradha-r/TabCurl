//
//  QTKBlackViewController.m
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/10/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import "QTKBlackViewController.h"
#import "QTKScrollBarViewController.h"

@interface QTKBlackViewController ()
@property (nonatomic, assign) int selectedTopNavTabIndex;
@end

@implementation QTKBlackViewController
@synthesize topNavContainerView;
@synthesize topNavViewControllers;
@synthesize btnSwim;
@synthesize btnGym;
@synthesize btnTrack;
@synthesize topNavTabItems;
@synthesize selectedTopNavTabIndex;
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
    self.topNavViewControllers = [[NSMutableArray alloc]init];
    
    QTKScrollBarViewController *scrollViewController1 = [[QTKScrollBarViewController alloc]init];
    [scrollViewController1.view setBackgroundColor:[UIColor cyanColor]];
    //[topNavContainerOneController addChildViewController:scrollViewController];
    [topNavContainerView addSubview:scrollViewController1.view];
    [self addChildViewController:scrollViewController1];
    [self.topNavViewControllers  addObject:scrollViewController1];
    

    UIViewController *topNavContainerTwoController = [[UIViewController alloc]init];
    [topNavContainerTwoController.view setBackgroundColor:[UIColor grayColor]];
    [self addChildViewController:topNavContainerTwoController];
    [self.topNavViewControllers addObject:topNavContainerTwoController];
    
    UIViewController *topNavContainerThreeController = [[UIViewController alloc]init];
    [topNavContainerThreeController.view setBackgroundColor:[UIColor brownColor]];
    [self addChildViewController:topNavContainerThreeController];
    [self.topNavViewControllers addObject:topNavContainerThreeController];
    
    self.selectedTopNavTabIndex = 0;
    [self.topNavContainerView addSubview:scrollViewController1.view];
    scrollViewController1.view.frame = self.topNavContainerView.bounds;
    self.topNavContainerView.clipsToBounds = YES;
    
}

- (void)viewDidUnload
{
    [self setTopNavContainerView:nil];
     [self setBtnGym:nil];
    [self setBtnSwim:nil];
    [self setBtnTrack:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


- (IBAction)btnGymTapped:(id)sender {
    UIViewController *deselectedTabController = [self.topNavViewControllers objectAtIndex:self.selectedTopNavTabIndex];
    [deselectedTabController.view removeFromSuperview];
    self.selectedTopNavTabIndex = 1;
    UIViewController *selectedTabController = [self.topNavViewControllers objectAtIndex:1];
    [self.topNavContainerView addSubview: selectedTabController.view];
    selectedTabController.view.frame = self.topNavContainerView.bounds;

}
- (IBAction)btnSwimmingTapped:(id)sender {
   
    UIViewController *deselectedTabController = [self.topNavViewControllers objectAtIndex:self.selectedTopNavTabIndex];
    [deselectedTabController.view removeFromSuperview];
    self.selectedTopNavTabIndex = 0;
    UIViewController *selectedTabController = [self.topNavViewControllers objectAtIndex:0];
    [self.topNavContainerView addSubview: selectedTabController.view];
    selectedTabController.view.frame = self.topNavContainerView.bounds;
}
- (IBAction)btnTracktapped:(id)sender {
    UIViewController *deselectedTabController = [self.topNavViewControllers objectAtIndex:self.selectedTopNavTabIndex];
    [deselectedTabController.view removeFromSuperview];
    self.selectedTopNavTabIndex = 2;
    UIViewController *selectedTabController = [self.topNavViewControllers objectAtIndex:2];
    [self.topNavContainerView addSubview: selectedTabController.view];
    selectedTabController.view.frame = self.topNavContainerView.bounds;
}
@end
