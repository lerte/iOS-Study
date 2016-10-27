//
//  Vehicle.h
//  iOS-Study
//
//  Created by Lerte Smith on 2016/10/27.
//  Copyright © 2016年 Lerte Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehicle : NSObject
-(void) drive;
-(void) startEngine;
-(void) stopEngine;
-(int) getEngineStatu;
-(void) breakDown;
@end

@interface Boat : Vehicle

@end


@interface Motocycle : Vehicle

@end
