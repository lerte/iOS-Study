//
//  Fruit.m
//  iOS-Study
//
//  Created by Lerte Smith on 2016/10/27.
//  Copyright © 2016年 Lerte Smith. All rights reserved.
//

#import "Fruit.h"

@implementation Fruit

@synthesize price;

-(void)getPrice:(NSNumber *)price name:(NSString *)name{
    NSLog(@"%@ s price is", name);
}

-(NSArray<NSNumber *> *) sorted:(NSArray<NSNumber *> *)array {
    NSInteger count = array.count;
    NSMutableArray<NSNumber *>* na = [[NSMutableArray alloc] initWithArray:array];
    for(int i=0;i<count;i++){
        for(int j=0;j<count;j++){
            NSNumber* n1 = [na objectAtIndex:i];
            NSNumber* n2 = [na objectAtIndex:j];
            NSNumber* temp = [[NSNumber alloc]init];
            if([n1 isGreaterThan:n2]){
                temp = n1;
                n1=n2;
                n2=temp;
            }
            [na setObject:n1 atIndexedSubscript:i];
            [na setObject:n2 atIndexedSubscript:j];
        }
    }
    return [[NSArray alloc] initWithArray:na];
}

@end
