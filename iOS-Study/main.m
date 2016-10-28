//
//  main.m
//  iOS-Study
//
//  Created by Lerte Smith on 2016/10/27.
//  Copyright © 2016年 Lerte Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fruit.h"
#import "Vehicle.h"
#import "Complex.h"
#import "Rectangle.h"
#import "Person.h"


void runExercise()
{
    
				
    NSLog(@"Chapter3_1 :");
    //		c3_1();
    NSLog(@"Chapter3_2 :");
    Vehicle* v = [[Vehicle alloc]init];
    [v startEngine];
    
    //    NSLog(@"Chapter4_2 :");
    
    
    NSLog(@"chapter4.2 :");
    double f = 123.0;
    exercise42(f);
    
    NSLog(@"chapter4.3 :");
    exercise43();
    
    NSLog(@"chapter4.4 :");
    exercise44(2.55);
    
    NSLog(@"chapter4.5 :");
    exercise45();
    
    NSLog(@"chapter4.6 :");
    Complex *c = [[Complex alloc]init];
    [c setReal:2.1];
    [c setImaginary:3.3];
    [c print];
    NSLog(@"chapter4.8");
    [c add];
    [c subtract];
    [c multiply];
    [c divide];
    
    NSLog(@"chapter4.7 :");
    Rectangle * r = [[Rectangle alloc]init];
    [r setWidth:2];
    [r setHeight:2];
    [r width];
    [r height];
    NSLog(@"area = %i",[r area]);
    NSLog(@"perimeter = %i",[r perimeter]);
    
}

//void runChapter5(){
//	NSLog(@"Chapter5.1 :");
//	exercise51();
//	NSLog(@"Chapter5.2 :");
//	exercise52();
//	NSLog(@"Chapter5.3 :");
//	exercise53();
//	NSLog(@"Chapter5.4 :");
//	exercise54();
//	NSLog(@"Chapter5.5 :");
//	exercise55();
//
//}



void getPersonTree(){
    Person* iPhone7Simulator = [[Person alloc] initWithName:@"iPhone7Simulator" children:nil];
    Person* xcode = [[Person alloc] initWithName:@"Xcode" children:@[[[Person alloc] initWithName:@"Simulator" children:@[iPhone7Simulator]],[[Person alloc] initWithName:@"Debugger" children:nil]]];
    Person* finder = [[Person alloc] initWithName:@"Finder" children:nil];
    Person* qq2016 = [[Person alloc] initWithName:@"QQ2016" children:nil];
    Person* qq = [[Person alloc] initWithName:@"QQ" children:@[qq2016]];
    Person* launcher = [[Person alloc] initWithName:@"Launcher" children:@[xcode, finder, qq]];
    NSLog(@"%@", [launcher dump]);
    Person * p = [launcher initFromDumpString:[launcher dump]];
    NSLog(@"%@", [p dump]);
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        getPersonTree();
    }
    return 0;
}

