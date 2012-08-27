//
//  QTKListViewController.h
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/27/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QTKListViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *pizzaInfo;

@end
