//
//  QTKSubTabViewController.m
//  TabPrototype
//
//  Created by Lee, Kevin W. on 7/26/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import "QTKSubTabViewController.h"
@interface QTKSubTabViewController ()
@property (nonatomic, strong) NSArray *viewControllers;
@property  NSUInteger selectedIndex;
- (void)handleSwipeRight;
- (void)handleSwipeLeft;
@end

@implementation QTKSubTabViewController
@synthesize contentView;
@synthesize viewControllers, selectedIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController *vcOne = [[UIViewController alloc] init];
    vcOne.view.backgroundColor = [UIColor colorWithRed:203/255. green:182/255. blue:119/255. alpha:1];
    [self addChildViewController:vcOne];
    [self.contentView addSubview:vcOne.view];
    vcOne.view.frame = self.contentView.bounds;
    self.selectedIndex = 0;


    UIViewController *vcTwo = [[UIViewController alloc] init];
    vcTwo.view.backgroundColor = [UIColor colorWithRed:184/255. green:120/255. blue:59/255. alpha:1];
    [self addChildViewController:vcTwo];

    UIViewController *vcThree = [[UIViewController alloc] init];
    vcThree.view.backgroundColor = [UIColor colorWithRed:138/255. green:77/255. blue:31/255. alpha:1];
    [self addChildViewController:vcThree];
    
    self.viewControllers = [NSArray arrayWithObjects:vcOne, vcTwo, vcThree, nil];
    
    UISwipeGestureRecognizer *swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft)];
    swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRight)];
    swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.contentView addGestureRecognizer:swipeRightRecognizer];
    [self.contentView addGestureRecognizer:swipeLeftRecognizer];
    self.contentView.clipsToBounds = YES;
    
}

- (void)viewDidUnload
{
    [self setContentView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)button1Tapped:(id)sender {
    if (self.selectedIndex !=0) {
        UIViewController *currentViewController = [self.viewControllers objectAtIndex:self.selectedIndex];
        UIViewController *vc = [self.viewControllers objectAtIndex:0];
        [self.contentView addSubview:vc.view];
        self.selectedIndex = 0;
        vc.view.frame = self.contentView.bounds;
        [currentViewController.view removeFromSuperview];            
    }    
}

- (IBAction)button2Tapped:(id)sender {
    if (self.selectedIndex !=1) {
        UIViewController *currentViewController = [self.viewControllers objectAtIndex:self.selectedIndex];
        UIViewController *vc = [self.viewControllers objectAtIndex:1];
        [self.contentView addSubview:vc.view];
        vc.view.frame = self.contentView.bounds;
        self.selectedIndex = 1;
        [currentViewController.view removeFromSuperview];            
    }    
}

- (IBAction)button3Tapped:(id)sender {
    if (self.selectedIndex !=2) {
        UIViewController *currentViewController = [self.viewControllers objectAtIndex:self.selectedIndex];
        UIViewController *vc = [self.viewControllers objectAtIndex:2];
        [self.contentView addSubview:vc.view];
        vc.view.frame = self.contentView.bounds;
        self.selectedIndex = 2;
        [currentViewController.view removeFromSuperview];            
    }    
}


- (void)handleSwipeRight {
    NSLog(@"swipe right");
    if (self.selectedIndex == 0) {
        return;
    }
    __block UIViewController *currentViewController = [self.viewControllers objectAtIndex:self.selectedIndex];
    __block CGRect currentFrame = currentViewController.view.frame;
    __block UIViewController *nextViewController = [self.viewControllers objectAtIndex:self.selectedIndex -1 ];
    [self.contentView addSubview:nextViewController.view];
    __block CGRect nextFrame = nextViewController.view.frame;
    nextFrame.origin.x = -currentFrame.size.width;
    nextViewController.view.frame = nextFrame;
    [UIView animateWithDuration:.25 animations:^{
        currentFrame.origin.x += currentFrame.size.width;
        currentViewController.view.frame = currentFrame;
        nextFrame.origin.x += currentFrame.size.width;
        nextViewController.view.frame = nextFrame;
    } completion:^(BOOL finished) {
        [currentViewController.view removeFromSuperview];
        self.selectedIndex -= 1;        
    }];

}

- (void)handleSwipeLeft{
    NSLog(@"swipe left");
    if (self.selectedIndex == ([self.viewControllers count] -1)) {
        return;
    }
    __block UIViewController *currentViewController = [self.viewControllers objectAtIndex:self.selectedIndex];
    __block CGRect currentFrame = currentViewController.view.frame;
    __block UIViewController *nextViewController = [self.viewControllers objectAtIndex:self.selectedIndex +1 ];
    [self.contentView addSubview:nextViewController.view];
    __block CGRect nextFrame = nextViewController.view.frame;
    nextFrame.origin.x = currentFrame.size.width;
    nextViewController.view.frame = nextFrame;
    [UIView animateWithDuration:.25 animations:^{
        currentFrame.origin.x -= currentFrame.size.width;
        currentViewController.view.frame = currentFrame;
        nextFrame.origin.x -= currentFrame.size.width;
        nextViewController.view.frame = nextFrame;
    } completion:^(BOOL finished) {
        [currentViewController.view removeFromSuperview];
        self.selectedIndex += 1;        
    }];
    

}
            
@end
