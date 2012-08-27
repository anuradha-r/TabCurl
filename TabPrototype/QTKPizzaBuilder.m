//
//  QTKPizzaBuilder.m
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/27/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import "QTKPizzaBuilder.h"

@implementation QTKPizzaBuilder

@synthesize pizzaCrusts = _pizzaCrusts;
@synthesize finalPizzaBuildingStep = _finalPizzaBuildingStep;

+ (id)sharedPizzaBuilder{
    static QTKPizzaBuilder *sharedPizzaBuilder = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedPizzaBuilder = [[QTKPizzaBuilder alloc]init];
    });
    return sharedPizzaBuilder;
}


- (NSArray *)pizzaTypesByCategory:(NSString *)category{
    NSArray *ingredient = [NSArray arrayWithArray:[[self pizzaBuilder] objectForKey:category]];
    return ingredient;
}

//Order in which pizza is built
- (NSArray *)pizzaIngredientsOrder{
    NSArray *order = [NSArray arrayWithObjects:kCrust , kSize, kSauce, kToppings, nil];    
    return order;
}

- (NSDictionary *)pizzaBuilder{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Pizza" ofType:@"plist"];
    NSDictionary *pizzaInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    return pizzaInfo;
}

- (NSInteger)finalPizzaBuildingStep{
    return [self.pizzaIngredientsOrder count] - 1;
}

@end
