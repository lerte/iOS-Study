//
//  Exam.h
//  iOS-Study
//
//  Created by Lerte Smith on 2016/10/27.
//  Copyright © 2016年 Lerte Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Process : NSObject
@property (nonatomic) NSString *name;   // 进程名
@property (nonatomic) NSArray<Process *> *children; // 子进程
- (instancetype)initWithName:(NSString*)name children:(NSArray<Process *> *)children ;
- (instancetype)initFromDumpString:(NSString*)dump;
- (NSString*)dump ;
@end
