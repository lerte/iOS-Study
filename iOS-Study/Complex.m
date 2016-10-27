//
//  Complex.m
//  iOS-Study
//
//  Created by Lerte Smith on 2016/10/27.
//  Copyright © 2016年 Lerte Smith. All rights reserved.
//

#import "Complex.h"

@implementation Complex

double aa;
double bb;

-(void) setReal: (double) a
{
    aa = a;
}
-(void) setImaginary: (double) b
{
    bb = b;
}
-(void) print // display as a + bi
{
    NSLog(@"%g+%gi",aa,bb);
}
-(double) real
{
    return aa;
}
-(double) imaginary
{
    return bb;
}
-(void) add
{
    NSLog(@"aa+bb = %g",aa+bb);
}
-(void) subtract
{
    NSLog(@"aa-bb = %g",aa-bb);
}
-(void) multiply
{
    NSLog(@"aa*bb = %g",aa*bb);
}
-(void) divide
{
    NSLog(@"aa/bb = %g",(aa/bb));
}

@end
