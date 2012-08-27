//
//  QTKPizzaBuilder.m
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/27/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import "QTKPizzaBuilder.h"

@implementation QTKPizzaBuilder

//Order in which pizza is built
- (NSArray *)pizzaIngredientsOrder{
    NSArray *order = [NSArray arrayWithObjects:kCrust , kSize, kSauce, kToppings, nil];    
    return order;
}

@end
