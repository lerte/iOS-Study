//
//  Person.h
//  iOS-Study
//
//  Created by Lerte Smith on 2016/10/27.
//  Copyright © 2016年 Lerte Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic) NSString *name; 
@property (nonatomic) NSArray<Person *> *children;
- (instancetype)initWithName:(NSString*)name children:(NSArray<Person *> *)children ;
- (instancetype)initFromDumpString:(NSString*)dump;
- (NSString*)dump ;
@end
