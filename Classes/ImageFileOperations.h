//
//  ImageFileOperations.h
//  AVCam
//
//  Created by nikolay on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageFileOperations : NSObject

-(void)saveImage:(UIImage *)image name:(NSString*)name;
-(UIImage*)loadImage:(NSString*)name;

-(void)saveImageAsCurrent:(UIImage *)image;
-(UIImage*)loadCurrentImage;

@end
