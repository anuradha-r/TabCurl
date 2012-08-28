//
//  QTKRightChildViewController.m
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/28/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import "QTKRightChildViewController.h"

@interface QTKRightChildViewController ()

@end

@implementation QTKRightChildViewController
@synthesize detailsTable;
@synthesize titleLabel;
@synthesize categoryTitle = _categoryTitle;
@synthesize tableData = _tableData;

- (id)initWithData:(NSArray *)data title:(NSString *)title{
    
    self = [self init];
    if(self){
        _tableData  = [NSArray arrayWithArray:data];
        _categoryTitle = title;
    }
    return self;
}


- (id)init{
    return [self initWithNibName:@"QTKRightChildViewController" bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setDetailsTable:nil];
    [self setTitleLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - Table View
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tableData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text =  [[self.tableData objectAtIndex:indexPath.row] objectForKey:@"title"];
    //cell.detailTextLabel.text = pizza.chosenCategoryDesc;
    return cell;
}

@end
