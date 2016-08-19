//
//  uzysRadialProgressActivityIndicator.m
//  UzysRadialProgressActivityIndicator
//
//  Created by Uzysjung on 13. 10. 22..
//  Copyright (c) 2013년 Uzysjung. All rights reserved.
//

#import "UzysRadialProgressActivityIndicator.h"

#define DEGREES_TO_RADIANS(x) (x)/180.0*M_PI
#define RADIANS_TO_DEGREES(x) (x)/M_PI*180.0

#define PulltoRefreshThreshold 50.0

@interface UzysRadialProgressActivityIndicatorBackgroundLayer : CALayer

@end
@implementation UzysRadialProgressActivityIndicatorBackgroundLayer
- (id)init
{
    self = [super init];
    if(self) {
        self.contentsScale = [UIScreen mainScreen].scale;
        [self setNeedsDisplay];
    }
    return self;
}

- (void)drawInContext:(CGContextRef)ctx
{
    //Draw white circle
//    CGContextSetFillColor(ctx, CGColorGetComponents([UIColor colorWithWhite:1.0 alpha:0.8].CGColor));
//    CGContextFillEllipseInRect(ctx,CGRectInset(self.bounds, 2, 2));

    //Draw circle outline
//    CGContextSetStrokeColorWithColor(ctx, [UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1].CGColor);
//    CGContextSetLineWidth(ctx, 0.1);
//    CGContextStrokeEllipseInRect(ctx, CGRectInset(self.bounds, 1, 1));
}
@end

/*-----------------------------------------------------------------*/
@interface UzysRadialProgressActivityIndicator()
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;  //Loading Indicator
@property (nonatomic, strong) UzysRadialProgressActivityIndicatorBackgroundLayer *backgroundLayer;
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
@property (nonatomic, strong) CALayer *imageLayer;
@property (nonatomic, strong) UIImage *imageIcon;
@property (nonatomic, strong) UILabel *titleLabel;

@end
@implementation UzysRadialProgressActivityIndicator

- (id)init
{
    self = [super initWithFrame:CGRectMake(0, -PulltoRefreshThreshold, 20, 20)];
    if(self) {
        [self _commonInit];
        
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(-120,0, 150.0f, 20)];
        _titleLabel.text = NSLocalizedString(@"PullDown", nil);
        _titleLabel.tag = 1000001;
        _titleLabel.textAlignment = UITextAlignmentCenter;
        _titleLabel.font = [UIFont fontWithName:@"Georgia-Bold" size:14];;
        _titleLabel.textColor = [UIColor colorWithRed:195/255.0 green:195/255.0 blue:195/255.0 alpha:1];
        _titleLabel.backgroundColor = [UIColor clearColor];
        
        [self addSubview:_titleLabel];
    }
    return self;
}
- (id)initWithImage:(UIImage *)image
{
    self = [super initWithFrame:CGRectMake(0, -PulltoRefreshThreshold, 25, 25)];
    if(self) {
        self.imageIcon =image;
        [self _commonInit];
    }
    return self;
}
- (void)_commonInit
{
    self.contentMode = UIViewContentModeRedraw;
    self.state = UZYSPullToRefreshStateNone;
    
    //init actitvity indicator
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityIndicatorView.hidesWhenStopped = YES;
    _activityIndicatorView.frame = self.bounds;
    [self addSubview:_activityIndicatorView];
    
    //init background layer
    UzysRadialProgressActivityIndicatorBackgroundLayer *backgroundLayer = [[UzysRadialProgressActivityIndicatorBackgroundLayer alloc] init];
    backgroundLayer.frame = self.bounds;

    [self.layer addSublayer:backgroundLayer];
    self.backgroundLayer = backgroundLayer;
//    if(!self.imageIcon)
//        self.imageIcon = [UIImage imageNamed:@"centerIcon"];
    
    //init icon layer
    CALayer *imageLayer = [CALayer layer];
    imageLayer.contentsScale = [UIScreen mainScreen].scale;
    imageLayer.frame = self.bounds;
    imageLayer.contents = (id)self.imageIcon.CGImage;
    [self.layer addSublayer:imageLayer];
    self.imageLayer = imageLayer;
    self.imageLayer.transform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(180),0,0,1);

    //init arc draw layer
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.frame = self.bounds;
    shapeLayer.fillColor = nil;
    shapeLayer.strokeColor = [UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1].CGColor;
    shapeLayer.strokeEnd = 0;
    shapeLayer.shadowColor = [UIColor colorWithWhite:1 alpha:0.8].CGColor;
    shapeLayer.shadowOpacity = 0.7;
    shapeLayer.shadowRadius = 20;
    shapeLayer.contentsScale = [UIScreen mainScreen].scale;
    shapeLayer.lineWidth = 5;

    [self.layer addSublayer:shapeLayer];
    self.shapeLayer = shapeLayer;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.shapeLayer.frame = self.bounds;
    [self updatePath];
    _titleLabel.frame = CGRectMake(self.bounds.size.width/2.0f - _titleLabel.frame.size.width/2.0f, _titleLabel.frame.origin.y, _titleLabel.frame.size.width, _titleLabel.frame.size.height);
    
}
- (void)updatePath {
    CGPoint center = CGPointMake(CGRectGetMaxX(_titleLabel.frame) + 10.0f, CGRectGetMidY(self.bounds));
    _activityIndicatorView.center = center;
    self.shapeLayer.path = [UIBezierPath bezierPathWithArcCenter:center radius:self.bounds.size.width/2 - 1 startAngle:-M_PI_2 endAngle:-M_PI_2 + 2 * M_PI clockwise:NO].CGPath;
}

#pragma mark - ScrollViewInset
- (void)setupScrollViewContentInsetForLoadingIndicator:(actionHandler)handler
{
    CGFloat offset = MAX(self.scrollView.contentOffset.y * -1, 0);
    UIEdgeInsets currentInsets = self.scrollView.contentInset;
    currentInsets.top = MIN(offset, self.originalTopInset + self.bounds.size.height + 20.0);
    [self setScrollViewContentInset:currentInsets handler:handler];
}
- (void)resetScrollViewContentInset:(actionHandler)handler
{
    UIEdgeInsets currentInsets = self.scrollView.contentInset;
    currentInsets.top = self.originalTopInset;
    [self setScrollViewContentInset:currentInsets handler:handler];
}
- (void)setScrollViewContentInset:(UIEdgeInsets)contentInset handler:(actionHandler)handler
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.scrollView.contentInset = contentInset;
                     }
                     completion:^(BOOL finished) {
                         if(handler)
                             handler();
                     }];
}
#pragma mark - property
- (void)setRProgress:(double)rProgress
{
    static double prevProgress;
    
    if(!_activityIndicatorView.isAnimating)
        _titleLabel.text = NSLocalizedString(@"PullDown", nil);
    if(rProgress > 1.0)
    {
        if(!_activityIndicatorView.isAnimating)
            _titleLabel.text = NSLocalizedString(@"ReleaseDown", nil);
        rProgress = 1.0;
    }
    if(rProgress >= 0.3){
        self.alpha = 1.0;
    }else{
        self.alpha = 0.0;
    }
//    self.alpha = 1.0 * rProgress;
//    _titleLabel.alpha = 1.0 * rProgress;

    if (rProgress >= 0 && rProgress <=1.0) {
        //rotation Animation
        CABasicAnimation *animationImage = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        animationImage.fromValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(180-180*prevProgress)];
        animationImage.toValue = [NSNumber numberWithFloat:DEGREES_TO_RADIANS(180-180*rProgress)];
        animationImage.duration = 0.15;
        animationImage.removedOnCompletion = NO;
        animationImage.fillMode = kCAFillModeForwards;
//        [CATransaction setDisableActions:YES];
//        self.imageLayer.transform = CATransform3DMakeRotation(DEGREES_TO_RADIANS(180-180*progress), 0, 0, 1);
//        [CATransaction setDisableActions:NO];
        [self.imageLayer addAnimation:animationImage forKey:@"animation"];

        //strokeAnimation
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        animation.fromValue = [NSNumber numberWithFloat:((CAShapeLayer *)self.shapeLayer.presentationLayer).strokeEnd];
        animation.toValue = [NSNumber numberWithFloat:rProgress];
        animation.duration = 0.15 + 0.35*(fabs([animation.fromValue doubleValue] - [animation.toValue doubleValue]));
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        [self.shapeLayer addAnimation:animation forKey:@"animation"];
        
    }
    _rProgress = rProgress;
    prevProgress = rProgress;
}
-(void)setLayerOpacity:(CGFloat)opacity
{
    self.imageLayer.opacity = opacity;
    self.backgroundLayer.opacity = opacity;
    self.shapeLayer.opacity = opacity;
}
-(void)setLayerHidden:(BOOL)hidden
{
    self.imageLayer.hidden = hidden;
    self.shapeLayer.hidden = hidden;
    self.backgroundLayer.hidden = hidden;
}
#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([keyPath isEqualToString:@"contentOffset"])
    {
        [self scrollViewDidScroll:[[change valueForKey:NSKeyValueChangeNewKey] CGPointValue]];
    }
    else if([keyPath isEqualToString:@"contentSize"])
    {
        [self setNeedsLayout];
        [self setNeedsDisplay];
    }
    else if([keyPath isEqualToString:@"frame"])
    {
        [self setNeedsLayout];
        [self setNeedsDisplay];
    }
}

- (void)scrollViewDidScroll:(CGPoint)contentOffset
{
    static double prevProgress;
//    NSLog(@"dragging %d",self.scrollView.dragging);
    CGFloat yOffset = contentOffset.y;
    self.rProgress = ((yOffset+ self.originalTopInset)/-PulltoRefreshThreshold);
    
    self.center = CGPointMake(self.center.x, (contentOffset.y+ self.originalTopInset)/2);
    switch (_state) {
        case UZYSPullToRefreshStateStopped: //finish
//            NSLog(@"StateStop");
//            [self actionStopState];
            break;
        case UZYSPullToRefreshStateNone: //detect action
        {
//            NSLog(@"StateNone");
            if(self.scrollView.isDragging && yOffset <0 )
            {
                self.state = UZYSPullToRefreshStateTriggering;
            }
        }
        case UZYSPullToRefreshStateTriggering: //progress
        {
//             NSLog(@"StateTrigering");
                if(self.rProgress >= 1.0)
                    self.state = UZYSPullToRefreshStateTriggered;
        }
            break;
        case UZYSPullToRefreshStateTriggered: //fire actionhandler
//            NSLog(@"StateTrigered %f dragging %d",prevProgress,self.scrollView.dragging);
            if(self.scrollView.dragging == NO && prevProgress > 0.99)
            {
                [self actionTriggeredState];
            }
            break;
        case UZYSPullToRefreshStateLoading: //wait until stopIndicatorAnimation
            break;
        default:
            break;
    }
    //because of iOS6 KVO performance
    prevProgress = self.rProgress;
    
}
-(void)actionStopState
{
    self.state = UZYSPullToRefreshStateNone;
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction animations:^{
        self.activityIndicatorView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
        self.activityIndicatorView.transform = CGAffineTransformIdentity;
        _titleLabel.text = NSLocalizedString(@"Loaded", nil);
        [self.activityIndicatorView stopAnimating];
        
//        [self.scrollView setContentOffset:CGPointMake(0, -(self.originalTopInset + self.bounds.size.height + 20.0)) animated:YES];
        
        [self.scrollView setContentOffset:CGPointMake(0, -(self.originalTopInset + self.bounds.size.height + 20.0)) animated:NO];
    
        [self resetScrollViewContentInset:^{
            [self setLayerHidden:NO];
            [self setLayerOpacity:1.0];
            [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        }];

    }];
}
-(void)actionTriggeredState
{
//    NSLog(@"call triggered state");
    self.state = UZYSPullToRefreshStateLoading;
    
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction animations:^{
        [self setLayerOpacity:0.0];
    } completion:^(BOOL finished) {
        [self setLayerHidden:YES];
    }];
    _titleLabel.text = NSLocalizedString(@"Loading", nil);
    [self.activityIndicatorView startAnimating];
    [self setupScrollViewContentInsetForLoadingIndicator:nil];
    if(self.pullToRefreshHandler)
        self.pullToRefreshHandler();
    
}

#pragma mark - public method
- (void)stopIndicatorAnimation
{
    [self actionStopState];
}
- (void)manuallyTriggered
{
    [self setLayerOpacity:0.0];

    UIEdgeInsets currentInsets = self.scrollView.contentInset;
    currentInsets.top = self.originalTopInset + self.bounds.size.height + 20.0;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x, -currentInsets.top);
    } completion:^(BOOL finished) {
        [self actionTriggeredState];
    }];
//    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, -currentInsets.top) animated:YES];

}


@end