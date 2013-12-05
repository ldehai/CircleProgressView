//
//  CircleProgressView.h
//
//  Created by Andy Liu on 12/05/13.
//

#import "CircleProgressView.h"

#define kCircleSegs 100

@implementation CircleProgressView
@synthesize currentProgress;
@synthesize numberColor;
@synthesize numberFont;
@synthesize circleColor;
@synthesize circleBorderWidth;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.numberColor = [UIColor blackColor];
        self.numberFont = [UIFont fontWithName:@"Avenir Next Condensed" size:16.0f];
        self.circleColor = [UIColor colorWithRed:42.0/255.0 green:181.0/255.0 blue:145.0/255.0 alpha:1.0];
        self.circleBorderWidth = 4;
        
        self.currentProgress = 0;
        
        self.backgroundColor = [UIColor clearColor];

    }
    return self;
}

- (void)update:(int)progress {
    self.currentProgress = progress;
    
    //NSLog(@"set progress to :%d",progress);
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    float radius = CGRectGetWidth(rect)/2.0f - self.circleBorderWidth/2.0f;
    float angleOffset = M_PI_2;

    CGContextSetLineWidth(context, self.circleBorderWidth);
    CGContextBeginPath(context);

    CGContextAddArc(context,
                    CGRectGetMidX(rect), CGRectGetMidY(rect),
                    radius,
                    -angleOffset,
                    self.currentProgress/(float)kCircleSegs*M_PI*2 - angleOffset,
                    0);
    
    CGContextSetStrokeColorWithColor(context, self.circleColor.CGColor);
    CGContextStrokePath(context);
    
    if (self.currentProgress != kCircleSegs) {
        CGContextAddArc(context,
                        CGRectGetMidX(rect), CGRectGetMidY(rect),
                        radius,
                        self.currentProgress/(float)kCircleSegs*M_PI*2 - angleOffset,
                        -angleOffset,
                        0);
        
        CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:241.0/255.0 green:241.0/255.0 blue:241.0/255.0 alpha:1.0].CGColor);
        CGContextStrokePath(context);
    }
    
    CGContextSetLineWidth(context, 1.0f);
    NSString *numberText = [NSString stringWithFormat:@"%d",self.currentProgress];
    CGSize sz = [numberText sizeWithFont:self.numberFont];
    [numberText drawInRect:CGRectInset(rect, (CGRectGetWidth(rect) - sz.width)/2.0f, (CGRectGetHeight(rect) - sz.height)/2.0f) withFont:self.numberFont];
}

@end
