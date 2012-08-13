//
//  QTKVerticalScrollViewController.h
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/13/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QTKVerticalScrollViewController : UIViewController

@property (nonatomic, strong) NSArray *thumbnails;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
