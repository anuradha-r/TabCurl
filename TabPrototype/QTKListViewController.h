//
//  QTKListViewController.h
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/27/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QTKListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *pizzaInfo;
@property (weak, nonatomic) IBOutlet UITableView *pizzaInfoTable;

- (id)initWithPizzaInfo:(NSArray *)pizzaInfo;
@end
