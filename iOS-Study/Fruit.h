//
//  Fruit.h
//  iOS-Study
//
//  Created by Lerte Smith on 2016/10/27.
//  Copyright © 2016年 Lerte Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fruit : NSObject

@property double price;

-(void) getPrice:(NSNumber *) price name:(NSString *)name;

-(NSArray<NSNumber *> *) sorted:(NSArray<NSNumber *> *)array;

@end
