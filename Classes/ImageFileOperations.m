//
//  ImageFileOperations.m
//  AVCam
//
//  Created by nikolay on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AVCamCaptureManager.h"
#import "ImageFileOperations.h"

@implementation ImageFileOperations

-(void)saveImage:(UIImage *)image name:(NSString*)name{
    NSData *imageData = UIImagePNGRepresentation(image); //convert image into .png format.
    
    NSFileManager *fileManager = [NSFileManager defaultManager];//create instance of NSFileManager
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //create an array and store result of our search for the documents directory in it
    
    NSString *documentsDirectory = [paths objectAtIndex:0]; //create NSString object, that holds our exact path to the documents directory
    
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", name]]; //add our image to the path
    
    [fileManager createFileAtPath:fullPath contents:imageData attributes:nil]; //finally save the path (image)
    
    //saving to current image
    [[AVCamCaptureManager currentImage] initWithData:imageData];
    
    NSLog(@"image saved");    
}

-(UIImage*)loadImage:(NSString*)name{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", name]];
    
    NSLog(@"image loaded");
    
    return [UIImage imageWithContentsOfFile:fullPath];
}


-(void)saveImageAsCurrent:(UIImage *)image{
    NSData *imageData = UIImagePNGRepresentation(image); //convert image into .png format.
    
    //saving to current image
    [[AVCamCaptureManager currentImage] initWithData:imageData];
    
    NSLog(@"image saved");    
    
    //notify about new picture
    [[NSNotificationCenter defaultCenter] postNotificationName:@"currentImageSaved" object:nil];    
}

-(UIImage*)loadCurrentImage{
    return [AVCamCaptureManager currentImage];
}

@end


