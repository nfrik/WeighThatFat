//
//  PhotoPreviewController.m
//  AVCam
//
//  Created by nikolay on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PhotoPreviewController.h"
#import "AVCamCaptureManager.h"

@implementation PhotoPreviewController

@synthesize imagePreviewView;
@synthesize retakeButton;
@synthesize actionButton;
@synthesize saveButton;
@synthesize imageOperations;
@synthesize touchController;
@synthesize customDrawingView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization        
    }
    
    if (imageOperations==nil) {
        imageOperations = [[ImageFileOperations alloc] init];
    }
    
    //set notification for new image arrival
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(imageUpdatedNotification:)
     name:@"currentImageSaved"
     object:nil ];
    
    
    return self;
}


-(void)dealloc{
    [imageOperations release];
    [touchController release];    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)viewWillAppear:(BOOL)animated{
    // Do any additional setup after loading the view from its nib.
//    UIImage *roateImage = [[UIImage alloc] initWithCGImage:[[imageOperations loadImage:@"currentimage"] CGImage] scale:1.0f orientation:UIImageOrientationRight];  
}

#pragma mark -
#pragma tool bar buttons actions

-(void)toggleRetakeButton:(id)sender{
    [self.view removeFromSuperview];
}

-(void)toggleActionButton:(id)sender{
    
}

-(void)toggleSaveButton:(id)sender{
    
}

-(void)imageUpdatedNotification:(NSNotification*)notification{
    
    UIImage *roateImage = [[UIImage alloc] initWithCGImage:[[AVCamCaptureManager currentImage] CGImage] scale:1.0f orientation:UIImageOrientationRight];    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:roateImage];
    
    [imageView setFrame:imagePreviewView.frame];
    
    [[self imagePreviewView] addSubview:imageView];
    
    [imageView release];      
    
    
    //--init touch controller
    //--------------------------------
//      [touchView setFrame:[imagePreviewView frame]];
//       touchController = [[AVCamTouchController alloc] initWithFrame:[[self touchView] bounds]];
//      [[self imagePreviewView] addSubview:touchController];
    //--------------------------------
    //--------------------------------           
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if([touches count]==1){
        UITouch *touch = [touches anyObject];
        CGPoint tapPoint=[touch locationInView:imagePreviewView];
        NSLog(@"x:%f y:%f",tapPoint.x,tapPoint.y);
//        switch (pointnumber) {
//            case 0:
//                //                   p1x=tapPoint.y/self.frame.size.height*320;
//                //                   p1y=(1-tapPoint.x/self.frame.size.width)*215;
//                //pointnumber++;
//                break;
//            case 1:
//                //                   p2x=tapPoint.y/self.frame.size.height*320;
//                //                   p2y=(1-tapPoint.x/self.frame.size.width)*215;
//                //pointnumber++;
//                break;
//            case 2:
//                //                   p3x=tapPoint.y/self.frame.size.height*320;
//                //                   p3y=(1-tapPoint.x/self.frame.size.width)*215;
//                //pointnumber++;
//                break;
//            case 3:
//                //                   p4x=tapPoint.y/self.frame.size.height*320;
//                //                   p4y=(1-tapPoint.x/self.frame.size.width)*215;
//                //pointnumber++;
//                break;                        
//            case 4:
//                //                   p4x=tapPoint.y/self.frame.size.height*320;
//                //                   p4y=(1-tapPoint.x/self.frame.size.width)*215;
//                //pointnumber++;
//                break;
//            default:
//                break;
//        }
//        if(pointnumber==MAX_POINT_NUMBER)
//            pointnumber=0;
//        //need_to_init = 1;
        
        
        NSLog(@"Touch catch");
        
        [customDrawingView drawLineFrom:CGPointMake(0, tapPoint.y) to:CGPointMake(320, tapPoint.y)];
                
    }
     
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint tapPoint=[touch locationInView:imagePreviewView];    
    [customDrawingView drawLineFrom:CGPointMake(0, tapPoint.y) to:CGPointMake(320, tapPoint.y)];
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

@end
