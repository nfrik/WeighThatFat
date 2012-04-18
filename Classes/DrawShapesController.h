//
//  DrawShapesController.h
//  AVCam
//
//  Created by nikolay on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawShapesController : UIView{
           CGPoint fromPoint;
           CGPoint toPoint;
}

- (void)drawLineFrom:(CGPoint)from to:(CGPoint)to;

@end
