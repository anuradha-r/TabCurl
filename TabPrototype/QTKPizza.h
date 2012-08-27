//
//  QTKPizza.h
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/27/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QTKPizza : NSObject

@property (nonatomic, strong) NSString *crustTitle, *crustDesc;
@property (nonatomic, strong) NSString *sizeTitle, *sizeDesc;
@property (nonatomic, strong) NSString *sauceTitle, *sauceDesc;
@property (nonatomic, strong) NSArray  *toppings;

@end
