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
#import "QTKPizza.h"
#import "QTKRightChildViewController.h"

@interface QTKPizzaViewController (){
    QTKListViewController *listViewController;
    QTKRightChildViewController *rightChildViewController;
    NSMutableArray *leftChildDisplayData;
    NSMutableArray *rightChildDisplayData;
}

@property (nonatomic, assign) NSInteger totalNumberOfIngredients;
@end

@implementation QTKPizzaViewController

//@synthesize currentPizzaBuildingStep = _currentPizzaBuildingStep;
@synthesize ingredientDetailView = _ingredientDetailView;
@synthesize chosenIngredientsListView = _chosenIngredientsListView;
@synthesize numberOfIngredientsChosen;
@synthesize totalNumberOfIngredients = _totalNumberOfIngredients;

- (id)init{
    return [self initWithNibName:@"QTKPizzaViewController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNotifications];
    [self setupChildViews];
    self.totalNumberOfIngredients = [[QTKPizzaBuilder sharedPizzaBuilder]numberOfpizzaIngredients];
    self.numberOfIngredientsChosen = 0;
}

- (void)viewDidUnload {
    [self setIngredientDetailView:nil];
     [self setChosenIngredientsListView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
	return YES;
}

- (void)setupNotifications{
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(leftChildSelectionChanged:) 
                                                 name:kLeftChildCategorySelectedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(rightChildSelectionChanged:) 
                                                 name:kRightChildDataChangedNotification object:nil];
}

- (void)setupChildViews{
    NSArray *ingredientCategories = [NSArray arrayWithArray:[[QTKPizzaBuilder sharedPizzaBuilder] pizzaIngredientsOrder]];
    leftChildDisplayData = [[NSMutableArray alloc]init];
    BOOL showCategory = YES;
    for(NSString *category in ingredientCategories){
        QTKPizza *pizza = [[QTKPizza alloc]init];
        pizza.category = category;
        pizza.show = showCategory;
        showCategory = NO;
        [leftChildDisplayData addObject:pizza];
    }
    [self setupLeftChildViewWithData:leftChildDisplayData];
    NSString *currentCategory = [ingredientCategories objectAtIndex: self.numberOfIngredientsChosen];
    rightChildDisplayData = [NSMutableArray arrayWithArray:[[QTKPizzaBuilder sharedPizzaBuilder]pizzaTypesByCategory:currentCategory]];
    [self setupRightChildViewWithCategory:currentCategory data:rightChildDisplayData];
}

- (void)setupLeftChildViewWithData:(NSArray *)data{
     listViewController= [[QTKListViewController alloc]initWithPizzaInfo:data];
    [self addChildViewController:listViewController];
    //[listViewController didMoveToParentViewController:self];
    [self.chosenIngredientsListView setBackgroundColor:[UIColor cyanColor]];
    [self.chosenIngredientsListView addSubview: listViewController.view];
    listViewController.view.frame = self.chosenIngredientsListView.bounds;
    listViewController.view.clipsToBounds = YES;
    
}

- (void)setupRightChildViewWithCategory:(NSString *)category data:(NSArray *)data{
    rightChildViewController = [[QTKRightChildViewController alloc]initWithData:data title:category];
    [self addChildViewController:rightChildViewController];
    [self.ingredientDetailView addSubview:rightChildViewController.view];
    rightChildViewController.view.frame = self.ingredientDetailView.bounds;
    rightChildViewController.view.clipsToBounds = YES;
}

#pragma mark - Notifications

//- (void)showFirstCategoryOptions{
//    self.currentPizzaBuildingStep = 0;
//    NSString *category = [[[QTKPizzaBuilder sharedPizzaBuilder] pizzaIngredientsOrder] objectAtIndex:0];
//    NSArray *categoryInfo = [[QTKPizzaBuilder sharedPizzaBuilder] pizzaTypesByCategory:category];
//    
//    QTKPizza *pizza = [[QTKPizza alloc]init];
//    pizza.category = category;
//    pizza.chosenCategoryTitle = @"";
//    pizza.chosenCategoryDesc = @"";
//    
//    NSArray *leftChildData = [NSArray arrayWithObject:pizza];
//   //NSDictionary *
//    [[NSNotificationCenter defaultCenter]postNotificationName:kLeftChildDataChangedNotification 
//                                                       object:nil 
//                                                     userInfo:[NSDictionary dictionaryWithObject:leftChildData forKey:kLeftChildDataChangedNotificationUserInfoKey]
//     ];
//}
- (void)leftChildSelectionChanged:(NSNotification *)notification{

}

- (void)rightChildSelectionChanged:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo]; 
    NSString *category = [userInfo objectForKey:kRightChildDataChangedNotificationCategoryKey];
    NSString *selection = [userInfo objectForKey:kRightChildDataChangedNotificationSelectionKey];
    [self updateLeftChildViewCategory:category withSelection:selection];
    for(QTKPizza *pizza in leftChildDisplayData){
        if([pizza.category isEqualToString:category]){
            pizza.chosenCategoryTitle = selection;
            break;
            //[leftChildDisplayData replaceObjectWith
        }
    }
}

- (void)updateLeftChildViewCategory:(NSString *)category withSelection:(NSString *)selection{
    
}

@end
