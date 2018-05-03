//
//  LTMusicManager.m
//  LTMusicPlayer
//
//  Created by lt on 2018/4/25.
//  Copyright © 2018年 lt. All rights reserved.
//

#import "LTMusicManager.h"
#import "DDAudioLRCParser.h"


@interface LTMusicManager()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSTimeInterval playTime;      /**< 当前播放时间 单位：s*/

@property (nonatomic, assign) NSTimeInterval totalTime;     /**< 歌曲总长 单位：s */

@property (nonatomic, strong) DDAudioLRC *lrcData;

@end

@implementation LTMusicManager

+ (instancetype)sharedInstance {
    
    static LTMusicManager *obj;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if (!obj) {
            obj = [[LTMusicManager alloc] init];
            obj.playTime = 0;
        }
    });
    
    return obj;
}

- (instancetype)init {
    
    if (self = [super init]) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"TestLRC1" ofType:@""];
        NSString *text = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        self.lrcData = [DDAudioLRCParser parserLRCText:text];
        
        NSString *timeString = [self.lrcData metadataForKey:(NSString *)kDDLRCMetadataKeyTIME];
        self.totalTime = [timeString floatValue];
    }
    
    return self;
}

#pragma mark - Timer Control

- (void)timerAction {
    
    self.playTime += 0.1;
    
    NSInteger index = [self.lrcData lineAtTimeSecond:self.playTime];
    DDAudioLRCUnit *unit = [self.lrcData LRCUnitAtLine:index];
    
    float progress = 0;
    if (unit.timeLength != 0) {
        progress = (self.playTime - unit.sec) / unit.timeLength;
    }
    
    NSDictionary *infoDic = @{@"time":@(self.playTime),
                              @"index": @(index),
                              @"progress": @(progress)
                              };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LTMusicNotifaction" object:nil userInfo:infoDic];
}

- (void)restart {
    self.playTime = 0;
}

- (void)pause {
    [self.timer setFireDate:[NSDate distantFuture]];
}

- (void)resume {
    [self.timer setFireDate:[NSDate date]];
}

@end
