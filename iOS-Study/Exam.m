//
//  Exam.m
//  iOS-Study
//
//  Created by Lerte Smith on 2016/10/27.
//  Copyright © 2016年 Lerte Smith. All rights reserved.
//

#import "Exam.h"

@implementation Process
- (instancetype)initWithName:(NSString*)name children:(NSArray<Process *> *)children {
    if (self = [super init]) {
        _name = name;
        _children = children;
    }
    return self;
}
- (instancetype)initFromDumpString:(NSString*)dump {
    // TODO
    return nil;
}
- (NSString*)dump {
    NSMutableString * mstr = [[NSMutableString alloc] initWithFormat:@"\n%@",_name];
    NSInteger count = [_children count];
    
    for(int i=0;i<count;i++){
        Process * child = _children[i];
        NSString* childStr;
        if(i==count-1){
            childStr =[[NSString alloc]initWithFormat: @"\n└─ %@",child.name];
        }else{
            childStr = [[NSString alloc]initWithFormat:@"\n├─ %@",child.name];
        }
        
        [mstr appendString:childStr];
        
        if([[child children] count] > 0){
            NSString* childRet = [child dump];
            NSRange range = [childRet rangeOfString:child.name];
            NSString* string1 = [childRet substringFromIndex:(range.location+child.name.length)];
            string1=[string1 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n│  "];
            [mstr appendString:string1];
        }
    }
    return [[NSString alloc ] initWithString:mstr];
}
@end

/* 输出
 Launcher
 ├─ Xcode
 │  ├─ Simulator
 │  └─ Debugger
 ├─ Finder
 └─ QQ
 */

