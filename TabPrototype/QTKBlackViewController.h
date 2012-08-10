//
//  QTKBlackViewController.h
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/10/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QTKBlackViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *topNavContainerView;
@property (strong, nonatomic) NSArray *topNavTabItems;
@property (strong, nonatomic)NSMutableArray *topNavViewControllers;


@property (weak, nonatomic) IBOutlet UIButton *btnSwim;
@property (weak, nonatomic) IBOutlet UIButton *btnGym;
@property (weak, nonatomic) IBOutlet UIButton *btnTrack;

- (IBAction)btnSwimmingTapped:(id)sender;
- (IBAction)btnGymTapped:(id)sender;
- (IBAction)btnTracktapped:(id)sender;




@end
