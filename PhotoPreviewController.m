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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization        
    }
    
    if (imageOperations==nil) {
        imageOperations = [[ImageFileOperations alloc] init];
    }
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(imageUpdatedNotification:)
     name:@"currentImageSaved"
     object:nil ];
    
    return self;
}


-(void)dealloc{
    [imageOperations release];
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
}

@end
