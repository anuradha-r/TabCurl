//
//  QTKRightChildViewController.h
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/28/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QTKRightChildViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *detailsTable;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) NSArray *tableData;
@property (strong, nonatomic) NSString *categoryTitle;

- (id)initWithData:(NSArray *)data title:(NSString *)title;
@end
