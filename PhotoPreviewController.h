//
//  PhotoPreviewController.h
//  AVCam
//
//  Created by nikolay on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageFileOperations.h"
#import "AVCamTouchController.h"
#import "DrawShapesController.h"

@interface PhotoPreviewController : UIViewController {
    BOOL mouseSwiped;
}

//@property (nonatomic,retain) DrawShapesController *customDrawing;
@property (nonatomic,retain) AVCamTouchController *touchController;
@property (nonatomic,retain) ImageFileOperations* imageOperations;
@property (nonatomic,retain) IBOutlet UIView *imagePreviewView;
@property (nonatomic,retain) IBOutlet DrawShapesController *customDrawingView;
@property (nonatomic,retain) IBOutlet UIBarButtonItem *retakeButton;
@property (nonatomic,retain) IBOutlet UIBarButtonItem *actionButton;
@property (nonatomic,retain) IBOutlet UIBarButtonItem *saveButton;


-(IBAction)toggleRetakeButton:(id)sender;
-(IBAction)toggleActionButton:(id)sender;
-(IBAction)toggleSaveButton:(id)sender;

- (void)setCurrentImage:(UIImage*)image;
-(void)imageUpdatedNotification:(NSNotification *)notification;

@end
