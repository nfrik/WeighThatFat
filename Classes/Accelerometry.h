//
//  Accelerometry.h
//  AccelWorkTest2
//
//  Created by nikolay on 2/1/12.
//  Copyright (c) 2012 Nikolay Frik. All rights reserved.
//
//  Class Implements Simple Accelerometer manipulations
//  Acceleration -> Velocity -> Position
//   


#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>

@interface Accelerometry : NSObject <UIAccelerometerDelegate>{
    NSTimeInterval lastTimeStamp;
    UIAccelerometer *accelerometer;    

    //Accumulated values of acceleration
    CGFloat X;
    CGFloat Y;    
    CGFloat Z;    
    //Accumulated values of velocity
    CGFloat VX;    
    CGFloat VY;
    CGFloat VZ;
    //Instant acceleration
    CGFloat AX;    
    CGFloat AY;
    CGFloat AZ;
    //Instant attitude Euler angles
    CGFloat roll;
    CGFloat pitch;
    CGFloat yaw;
    //Accumulated acceleration
    CGFloat Acceleration;        
    //Counters for accumulation
    int accelCount;
    int velocCount;
    int positCount;  
    //accumulation arrays
    CGFloat *aXarray; 
    CGFloat *aYarray;
    CGFloat *aZarray;    
    
    CMMotionManager *motionManager;
    CMAttitude *referenceAttitude;

}


@property (nonatomic,retain) UIAccelerometer *accelerometer;
@property (nonatomic,retain) NSArray *aXarray;
@property (nonatomic,retain) NSArray *aYarray;
@property (nonatomic,retain) NSArray *aZarray;
@property (assign) CGFloat X;
@property (assign) CGFloat Y;
@property (assign) CGFloat Z;
@property (assign) CGFloat VX;
@property (assign) CGFloat VY;
@property (assign) CGFloat VZ;
@property (assign) CGFloat AX;
@property (assign) CGFloat AY;
@property (assign) CGFloat AZ;
@property (assign) CGFloat roll;
@property (assign) CGFloat pitch;
@property (assign) CGFloat yaw;
@property (assign) CGFloat Acceleration;

-(void) resetAccelerometer;
-(void) startAccelerometer;
-(void) stopAccelerometer;
-(void) enableGyro;

@end
