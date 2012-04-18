//
//  Accelerometry.m
//  AccelWorkTest2
//
//  Created by nikolay on 2/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Accelerometry.h"

#define ACCUMULATING_MAX 10

@implementation Accelerometry

@synthesize accelerometer, X,Y,Z,VX,VY,VZ,AX,AY,AZ,Acceleration;
@synthesize roll,pitch,yaw;

-(id)init{    
    X=Y=Z=VX=VY=VZ=AX=AY=AZ=Acceleration=0;
    lastTimeStamp=0;
    accelCount=velocCount=positCount=0;
    aXarray = (CGFloat*)malloc(ACCUMULATING_MAX*sizeof(CGFloat));
    aYarray = (CGFloat*)malloc(ACCUMULATING_MAX*sizeof(CGFloat));
    aZarray = (CGFloat*)malloc(ACCUMULATING_MAX*sizeof(CGFloat));
    
    motionManager = [[CMMotionManager alloc] init];
    referenceAttitude = nil; 
    
    [self enableGyro];
    
    self.accelerometer = [UIAccelerometer sharedAccelerometer];
    self.accelerometer.updateInterval = .1;
    self.accelerometer.delegate = self;
    return self;
}

-(void)dealloc{
    free(aXarray);
    free(aYarray);
    free(aZarray);
}

#pragma mark - Accelerometer

-(void) resetAccelerometer{
    X=Y=Z=VX=VY=VZ=AX=AY=AZ=0;   
    motionManager.gyroUpdateInterval=0.01;
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    //If first time
    if (lastTimeStamp==0) {
        lastTimeStamp=acceleration.timestamp;
        return;
    }    
    CGFloat dt = acceleration.timestamp - lastTimeStamp;
    //Save timestamp
    lastTimeStamp=acceleration.timestamp;
    //
    AX=motionManager.deviceMotion.userAcceleration.x*9.80665;
    AY=motionManager.deviceMotion.userAcceleration.y*9.80665;
    AZ=motionManager.deviceMotion.userAcceleration.z*9.80665;
    VX+=AX*dt;
    VY+=AY*dt;
    VZ+=AZ*dt;
    X+=VX*dt+0.5*AX*pow(dt,2);
    Y+=VY*dt+0.5*AY*pow(dt,2);
    Z+=VZ*dt+0.5*AZ*pow(dt,2);
    
    //Accumulating algorithms
    aXarray[accelCount]=AX;
    aYarray[accelCount]=AY;
    aZarray[accelCount]=AZ;
    accelCount++;
    CGFloat accumAX=0,accumAY=0,accumAZ=0;
    if(accelCount>=ACCUMULATING_MAX){
        for (int i=0; i<ACCUMULATING_MAX; i++) {
            accumAX+=aXarray[i];
            accumAY+=aYarray[i];
            accumAZ+=aZarray[i];
        }
        Acceleration=sqrt(pow(accumAX/ACCUMULATING_MAX, 2)+pow(accumAY/ACCUMULATING_MAX, 2)+pow(accumAZ/ACCUMULATING_MAX, 2));
        
       accelCount=0;        
    }
    
    //Obtain attitude
    CMDeviceMotion *deviceMotion = motionManager.deviceMotion;      
    CMAttitude *attitude = deviceMotion.attitude;
    roll=attitude.roll;
    pitch=attitude.pitch;
    yaw=attitude.yaw;
    
    NSLog(@"AX: %f AY: %f AZ: %f time: %f",AX,AY,AZ,acceleration.timestamp);    
    
    //
    //Push Notification!
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"didAccelerate"
     object:nil ];
}

#pragma - Gyroscope Setup

-(void) enableGyro{
    CMDeviceMotion *deviceMotion = motionManager.deviceMotion;
    CMAttitude *attitude = deviceMotion.attitude;
    referenceAttitude = [attitude retain];
    //[motionManager startGyroUpdates];
    [motionManager startDeviceMotionUpdatesUsingReferenceFrame:CMAttitudeReferenceFrameXMagneticNorthZVertical];
}

-(void) startAccelerometer{
    
}

-(void) stopAccelerometer{
    
}

@end
