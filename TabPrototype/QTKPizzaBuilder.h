//
//  QTKPizzaBuilder.h
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/27/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QTKPizzaBuilder : NSObject

@property (nonatomic, readonly) NSInteger finalPizzaBuildingStep;
@property (nonatomic, readonly) NSArray *pizzaCrusts;
@property (nonatomic, readonly) NSArray *pizzaIngredientsOrder;
 
+ (id)sharedPizzaBuilder;
- (NSArray *)pizzaTypesByCategory:(NSString *)category;
@end
