//
//  QTKListViewController.m
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/27/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import "QTKListViewController.h"
#import "QTKPizza.h"

@interface QTKListViewController ()

@end

@implementation QTKListViewController

@synthesize pizzaInfo = _pizzaInfo;
@synthesize pizzaInfoTable = _pizzaInfoTable;


- (id)initWithPizzaInfo:(NSArray *)pizzaInfo{
    
    self = [self init];
    if(self){
    _pizzaInfo = [NSArray arrayWithArray:pizzaInfo];
    }
    return self;
}

- (id)init{
    return [self initWithNibName:@"QTKListViewController" bundle:nil];    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.pizzaInfoTable reloadData];
    [self setupNotifications];
}

- (void)viewDidUnload
{
    [self setPizzaInfoTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)setupNotifications{

}


#pragma mark - Table View
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.pizzaInfo count];
}

- (NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    QTKPizza *pizza = [self.pizzaInfo objectAtIndex:section];
    NSString *title = pizza.category;
    return title;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    QTKPizza *pizza = [self.pizzaInfo objectAtIndex:indexPath.section];
    if(pizza.chosenCategoryTitle !=nil){
    cell.textLabel.text = pizza.chosenCategoryTitle;
    cell.detailTextLabel.text = pizza.chosenCategoryDesc;
    }
    else{
        cell.textLabel.text = [NSString stringWithFormat:@"Please choose a %@", pizza.category];
    }
    if(!pizza.show)
        cell.userInteractionEnabled = NO;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QTKPizza *pizza = [self.pizzaInfo objectAtIndex:indexPath.section];
    [[NSNotificationCenter defaultCenter]postNotificationName:kLeftChildCategorySelectedNotification 
                                                       object:nil 
                                                     userInfo:[NSDictionary dictionaryWithObject:pizza.category forKey:kLeftChildDataChangedNotificationUserInfoKey]
     ];
}

@end
