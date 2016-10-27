//
//  Complex.h
//  iOS-Study
//
//  Created by Lerte Smith on 2016/10/27.
//  Copyright © 2016年 Lerte Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Complex : NSObject

-(void) setReal: (double) a;
-(void) setImaginary: (double) b;
-(void) print; // display as a + bi
-(double) real;
-(double) imaginary;

-(void) add;
-(void) subtract;
-(void) multiply;
-(void) divide;

@end
