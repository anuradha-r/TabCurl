//
//  QTKPizzaViewControllerViewController.h
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/27/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QTKPizzaViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *ingredientDetailView;
@property (weak, nonatomic) IBOutlet UIView *chosenIngredientsListView;
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, assign) NSInteger currentPizzaBuildingStep;
@end
