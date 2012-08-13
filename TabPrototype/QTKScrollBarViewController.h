//
//  QTKScrollBarViewController.h
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/10/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QTKScrollBarViewController : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *slideBarContentContainer;


@property (strong, nonatomic) NSArray *thumbNails;
@property (strong ,nonatomic) NSArray *slideBarTabs;
@property (strong ,nonatomic) NSMutableArray *slideBarTabsViewControllers;
@property (strong, nonatomic) NSArray *slideBarThumbnails;

@property (strong, nonatomic) UISegmentedControl *slidebarSegmentedControl;

@property (strong, nonatomic) IBOutlet UIView *slideBarNavView;
@property (weak, nonatomic) IBOutlet UIButton *slideButton;

- (IBAction)slideButtonTapped:(id)sender;

@end
