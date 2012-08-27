//
//  QTKPizzaViewControllerViewController.m
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/27/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import "QTKPizzaViewController.h"
#import "QTKPizzaBuilder.h"
#import "QTKListViewController.h"

@interface QTKPizzaViewController ()

@end

@implementation QTKPizzaViewController

@synthesize currentPizzaBuildingStep = _currentPizzaBuildingStep;
@synthesize ingredientDetailView;
@synthesize chosenIngredientsListView;
@synthesize containerView;


- (id)init{
    return [self initWithNibName:@"QTKPizzaViewController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildViews];
    [self showFirstCategoryOptions];
    
}

- (void)viewDidUnload {
    [self setIngredientDetailView:nil];
    [self setContainerView:nil];
    [self setChosenIngredientsListView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
	return YES;
}

- (void)setupChildViews{
    QTKListViewController *listViewController = [[QTKListViewController alloc]init];
    [self addChildViewController:listViewController];
    self.chosenIngredientsListView = listViewController.view;
    listViewController.view.frame = self.chosenIngredientsListView.bounds;
    listViewController.view.clipsToBounds = YES;
}

#pragma mark - Notifications

- (void)showFirstCategoryOptions{
    self.currentPizzaBuildingStep = 0;
    NSString *category = [[[QTKPizzaBuilder sharedPizzaBuilder] pizzaIngredientsOrder] objectAtIndex:0];
    NSArray *categoryInfo = [[QTKPizzaBuilder sharedPizzaBuilder] pizzaTypesByCategory:category];
   //NSDictionary *
    [[NSNotificationCenter defaultCenter]postNotificationName:kPizzaIngredientChosenNotification object:nil 
                                                     userInfo:[NSDictionary dictionaryWithObject:categoryInfo forKey:kPizzaIngredientChosenNotificationUserInfoKey]];
}
@end
