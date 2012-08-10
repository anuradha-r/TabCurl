//
//  QTKScrollBarViewController.h
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/10/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QTKScrollBarViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) NSArray *thumbNails;
@property (strong ,nonatomic) NSArray *slideBarTabs;
@property (strong, nonatomic) UISegmentedControl *slidebarSegmentedControl;
@property (strong, nonatomic) IBOutlet UIView *slideBarNavView;

@end
