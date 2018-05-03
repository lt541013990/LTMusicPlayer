//
//  LTMusicManager.h
//  LTMusicPlayer
//
//  Created by lt on 2018/4/25.
//  Copyright © 2018年 lt. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LTMusicStatus) {
    
    LTMusicStatusStop = 0,
    LTMusicStatusPause = 1,
    LTMusicStatusPlaying = 2
};

@interface LTMusicManager : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, assign) LTMusicStatus status;



@end
