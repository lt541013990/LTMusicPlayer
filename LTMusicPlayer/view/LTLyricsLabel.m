//
//  LTLyricsLabel.m
//  LTMusicPlayer
//
//  Created by lt on 2018/4/23.
//  Copyright © 2018年 lt. All rights reserved.
//

#import "LTLyricsLabel.h"

@interface LTLyricsLabel ()

@property (nonatomic, strong) UILabel *frontLabel;

@property (nonatomic, strong) CALayer *ltLayer;

@property (nonatomic, assign) NSTimeInterval duration;

@end

@implementation LTLyricsLabel

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.text = @"确认过眼神 我遇见对的人";
        self.textColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = [UIColor clearColor];
        
        self.frontLabel.layer.mask = self.ltLayer;
        
        self.duration = 2;
        self.lyricsColor = [UIColor greenColor];
        
        [self addSubview:self.frontLabel];
    }
    return self;
}

- (void)layoutSubviews {
    
    self.frontLabel.frame = self.bounds;
    self.ltLayer.bounds = CGRectMake(0, 0, 0, self.frame.size.width);
}


/**
 重置进度
 */
- (void)resetProgress {
    
    self.progress = 0;
    
}

#pragma mark - Animation

- (void)start {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"bounds.size.width"];
    animation.values = @[@0,@(self.frame.size.width)];
    animation.keyTimes = @[@(0),@(1)];
    animation.duration = self.duration;
    animation.calculationMode = kCAAnimationLinear;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    [self.ltLayer addAnimation:animation forKey:@"animation"];
}

- (void)pause {
    
    CFTimeInterval pausedTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.layer.speed = 0.0;
    self.layer.timeOffset = pausedTime;
    
}

- (void)resume {
    
    CFTimeInterval pausedTime = [self.layer timeOffset];
    self.layer.speed = 1.0;
    self.layer.timeOffset = 0.0;
    self.layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.layer.beginTime = timeSincePause;
    
}

#pragma mark - set

- (void)setText:(NSString *)text {
    
    [super setText:text];
    self.frontLabel.text = text;
    [self sizeToFit];
}

- (void)setLyricsColor:(UIColor *)lyricsColor {
    
    _lyricsColor = lyricsColor;
    self.frontLabel.textColor = lyricsColor;
    
}

- (void)setProgress:(float)progress {
    
    _progress = progress;
    CGFloat width = self.frame.size.width * progress;
    self.ltLayer.bounds = CGRectMake(self.ltLayer.bounds.origin.x, self.ltLayer.bounds.origin.y, width, self.ltLayer.bounds.size.height);
    
}

#pragma mark - Lazy get

- (UILabel *)frontLabel {
    
    if (!_frontLabel) {
        _frontLabel = [[UILabel alloc] init];
        _frontLabel.text = @"确认过眼神 我遇见对的人";
        _frontLabel.textColor = self.lyricsColor;
        _frontLabel.textAlignment = NSTextAlignmentCenter;
        _frontLabel.backgroundColor = [UIColor clearColor];
        
    }
    return _frontLabel;
}

- (CALayer *)ltLayer {
    
    if (!_ltLayer) {
        _ltLayer = [CALayer layer];
        _ltLayer.anchorPoint = CGPointMake(0, 0.5);
        _ltLayer.position = CGPointMake(0, 0);
        _ltLayer.bounds = CGRectZero;
        _ltLayer.backgroundColor = [UIColor whiteColor].CGColor;
    }
    return _ltLayer;
    
}

@end
