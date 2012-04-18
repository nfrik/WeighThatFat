//
//  DrawShapesController.m
//  AVCam
//
//  Created by nikolay on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DrawShapesController.h"

@implementation DrawShapesController


- (void)initObject {
    // Initialization code
    [super setBackgroundColor:[UIColor clearColor]];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aCoder {
    if (self = [super initWithCoder:aCoder]) {
        // Initialization code
        [self initObject];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context    = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorSpace(context, CGColorSpaceCreateDeviceRGB());
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 2.0);
    
    
    CGContextMoveToPoint(context, fromPoint.x,fromPoint.y); //start at this point
    
    CGContextAddLineToPoint(context, toPoint.x, toPoint.y); //draw to this point
    
    // and now draw the Path!
    CGContextStrokePath(context);               
    
    // Draw a line from 'fromPoint' to 'toPoint'
}

- (void)drawLineFrom:(CGPoint)from to:(CGPoint)to {
    fromPoint = from;
    toPoint = to;
    
    // Refresh
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
