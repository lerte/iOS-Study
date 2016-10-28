//
//  Person.m
//  iOS-Study
//
//  Created by Lerte Smith on 2016/10/27.
//  Copyright © 2016年 Lerte Smith. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)initWithName:(NSString*)name children:(NSArray<Person *> *)children {
    if (self = [super init]) {
        _name = name;
        _children = children;
    }
    return self;
}

- (NSMutableArray* )getNodeNames:(NSString *)dump {
    NSArray* pieces = [dump componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"├└"]];
    NSMutableArray* nodeNames = [[NSMutableArray alloc]initWithArray:pieces];
    for(int i=0;i<nodeNames.count;i++){
        NSString* nodeName = nodeNames[i];
        [nodeNames replaceObjectAtIndex:i withObject:[[[[nodeName stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByReplacingOccurrencesOfString:@"─" withString:@""]stringByReplacingOccurrencesOfString:@"│" withString:@""]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    }
    return nodeNames;
}

- (NSMutableString *)replaceNodeData:(NSString *)dump nodeNames:(NSMutableArray *)nodeNames {
    NSMutableString* res = [[NSMutableString alloc] initWithString:dump];
    for(NSString * nodeName in nodeNames){
        res = [[res stringByReplacingOccurrencesOfString:nodeName withString:@"#"] mutableCopy];
    }
    return res;
}

- (void)getIndexes:(NSMutableArray *)newLineIndexes nodeIndexes:(NSMutableArray *)nodeIndexes dump:(NSMutableString *)dump {
    for(int i=0;i<dump.length;i++){
        char c=[dump characterAtIndex:i];
        if(c=='#'){
            [nodeIndexes addObject:[NSNumber numberWithInt:i]];
        }
        if(c=='\n'){
            [newLineIndexes addObject:[NSNumber numberWithInt:i]];
        }
    }
}

- (void)getLevelValue:(NSMutableArray<NSNumber*> *)levelValues nodeIndexes:(NSMutableArray<NSNumber*> *)nodeIndexes newLineIndexes:(NSMutableArray<NSNumber*> *)newLineIndexes{
    for(int i=0;i<nodeIndexes.count;i++){
        NSInteger levelValue = [nodeIndexes[i] integerValue]-[newLineIndexes[i] integerValue];
        [levelValues addObject:[NSNumber numberWithInteger:levelValue]];
    }
}

-(void) getChild2ParentMapping:(NSMutableDictionary<NSNumber*,NSNumber*>*)child2ParentMapping levelValues : (NSMutableArray*) levelValues{
    int lvlValueSize = (int)[levelValues count];
    for(int i=lvlValueSize-1;i>=0;i--){
        int levelValue = (int)[levelValues[i] integerValue];
        for(int j=i-1;j>=0;j--){
            int backwardLevelValue = (int)[levelValues[j] integerValue];
            if(levelValue>backwardLevelValue){
                NSNumber* child = [NSNumber numberWithInt:j];
                NSNumber* parent = [NSNumber numberWithInt:i];
                [child2ParentMapping setObject:child forKey:parent];
                break;
            }
        }
    }
}

-(void) getParent2ChildMapping:(NSMutableDictionary<NSNumber*,NSMutableArray<NSNumber*>*>*) parent2ChildMapping child2ParentMapping : (NSMutableDictionary<NSNumber*,NSNumber*>*)child2ParentMapping {
    for (NSNumber* child in child2ParentMapping) {
        id parent = child2ParentMapping[child];
        NSMutableArray<NSNumber*>* pcmObj = parent2ChildMapping[parent];
        if(pcmObj==nil){
            NSMutableArray<NSNumber*>* childrenList = [[NSMutableArray alloc]init];
            [childrenList addObject:child];
            [parent2ChildMapping setObject:childrenList forKey:parent];
        }else{
            [pcmObj addObject:child];
        }
    }
}

-(Person*) getPersonObj:(NSMutableDictionary<NSNumber*,NSMutableArray<NSNumber*>*>* )parent2ChildMapping nodeNames:(NSMutableArray*) nodeNames{
    Person* rootPerson = [[Person alloc]init];
    rootPerson.name=nodeNames[0];
    [self getPersonChildren:rootPerson parentNodeIndex:@0 parent2ChildMapping:parent2ChildMapping nodeNames:nodeNames];
    return rootPerson;
}

-(void)getPersonChildren:(Person*)parent parentNodeIndex:(NSNumber*)parentNodeIndex parent2ChildMapping:(NSMutableDictionary<NSNumber*,NSMutableArray<NSNumber*>*>* )parent2ChildMapping nodeNames:(NSMutableArray*) nodeNames {
    NSMutableArray<Person*>* children = [[NSMutableArray alloc]init];
    NSMutableArray<NSNumber*>* childrenArray= parent2ChildMapping[parentNodeIndex];
    for(NSNumber* childInt in childrenArray){
        Person* childP = [[Person alloc]init];
        childP.name=[nodeNames objectAtIndex:[childInt integerValue] ];
        [children addObject:childP];
        if(parent2ChildMapping[childInt]!=nil){
            [self getPersonChildren: childP parentNodeIndex:childInt parent2ChildMapping:parent2ChildMapping nodeNames:nodeNames];
        }
    }
    [parent setChildren:children];
}

- (instancetype)initFromDumpString:(NSString*)dump {
    NSMutableArray* nodeNames = [self getNodeNames:dump];//取得所有节点名字
    NSMutableString *dump2 = [self replaceNodeData:dump nodeNames:nodeNames];//将所有节点文字替换为"#"
    NSMutableArray* nodeIndexes = [[NSMutableArray alloc] init];//节点index
    NSMutableArray* newLineIndexes = [[NSMutableArray alloc] init];//换行符index
    [self getIndexes:newLineIndexes nodeIndexes:nodeIndexes dump:dump2];
    
    NSMutableArray* levelValues = [[NSMutableArray alloc] init];//节点级别值
    [self getLevelValue:levelValues nodeIndexes:nodeIndexes newLineIndexes:newLineIndexes];//计算节点级别值
    
    NSMutableDictionary<NSNumber*,NSNumber*>* child2ParentMapping = [[NSMutableDictionary alloc]init];//子节点到父节点映射
    [self getChild2ParentMapping:child2ParentMapping levelValues:levelValues];//计算子节点到父节点映射
    NSMutableDictionary<NSNumber*,NSMutableArray<NSNumber*>*>* parent2ChildMapping = [[NSMutableDictionary alloc]init];//父节点到子节点映射
    [self getParent2ChildMapping:parent2ChildMapping child2ParentMapping:child2ParentMapping];//计算父节点到子节点映射
    
    Person* person = [self getPersonObj:parent2ChildMapping nodeNames:nodeNames];
    
    return person;
}
- (NSString*)dump {
    NSMutableString * mstr = [[NSMutableString alloc] initWithFormat:@"\n%@",_name];
    NSInteger count = [_children count];
    
    for(int i=0;i<count;i++){
        Person * child = _children[i];
        NSString* childStr;
        if(i==count-1){
            childStr =[[NSString alloc]initWithFormat: @"\n└─ %@",child.name];
        }else{
            childStr = [[NSString alloc]initWithFormat:@"\n├─ %@",child.name];
        }
        
        [mstr appendString:childStr];
        
        if([child children]!=nil){
            NSString* childRet = [child dump];
            NSRange range = [childRet rangeOfString:child.name];
            childStr = [childRet substringFromIndex:(range.location+child.name.length)];
            if(i==count-1){
                childStr=[childStr stringByReplacingOccurrencesOfString:@"\n" withString:@"\n   "];
            }else{
                childStr=[childStr stringByReplacingOccurrencesOfString:@"\n" withString:@"\n│  "];
            }
            [mstr appendString:childStr];
        }
    }
    return [[NSString alloc ] initWithString:mstr];
}

@end
