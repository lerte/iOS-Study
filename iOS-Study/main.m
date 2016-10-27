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
#import "Exam.h"


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

void getProcessTree() {
    Process* s1 = [[Process alloc] initWithName:@"iPhone7 Simulator" children:@[ [[Process alloc] initWithName:@"iPhone777 Simulator" children:nil]]];
    Process* s2 = [[Process alloc] initWithName:@"iPhone6 Simulator" children:nil];
    Process* xcode = [[Process alloc] initWithName:@"Xcode"
                                          children:@[[[Process alloc] initWithName:@"Simulator" children:@[s1,s2]],[[Process alloc] initWithName:@"Debugger" children:nil],[[Process alloc] initWithName:@"Debugger2" children:nil]]];
    Process* finder = [[Process alloc] initWithName:@"Finder" children:nil];
    Process* qq = [[Process alloc] initWithName:@"QQ" children:nil];
    Process* launcher = [[Process alloc] initWithName:@"Launcher" children:@[xcode, finder, qq]];
    
    //NSLog(@"%@", [launcher dump]);
    NSLog(@"%@", [xcode initFromDumpString:[xcode dump]]);
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //runExercise();
        Fruit* f = [[Fruit alloc]init];
        NSArray* na = [f sorted:@[@4,@9,@5,@10,@6,@0,@3,@8,@1,@7,@2]];
        //NSLog(@"the result is %@",na);
        getProcessTree();
    }
    return 0;
}

