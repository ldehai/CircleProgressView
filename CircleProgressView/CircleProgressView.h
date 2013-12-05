//
//  CircleProgressView.h
//
//  Created by Andy Liu on 12/05/13.
//

#import <UIKit/UIKit.h>

@class CircleProgressView;

@interface CircleProgressView : UIView

@property (nonatomic, assign) int currentProgress;
@property (nonatomic, retain) UIColor *numberColor;
@property (nonatomic, retain) UIFont *numberFont;

@property (nonatomic, retain) UIColor *circleColor;
@property (nonatomic, assign) CGFloat circleBorderWidth;

- (void)update:(int)progress;
@end
