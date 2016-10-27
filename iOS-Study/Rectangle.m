//
//  Rectangle.m
//  iOS-Study
//
//  Created by Lerte Smith on 2016/10/27.
//  Copyright © 2016年 Lerte Smith. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

int width,height;

-(void) setRectangle:(int) w
                  h : (int) h
{
    width = w;
    height = h;
}
-(void) setWidth: (int) w
{
    width = w;
}
-(void) setHeight: (int) h
{
    height = h;
}
-(int) width
{
    NSLog(@"width=%i",width);
    return width;
}
-(int) height
{
    NSLog(@"height=%i",height);
    return height;
}
-(int) area
{
    return width*height;
}
-(int) perimeter
{
    return 2*width+2*height;
}

@end
