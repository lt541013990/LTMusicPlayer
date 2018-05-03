//
//  LTLyricsLabel.h
//  LTMusicPlayer
//
//  Created by lt on 2018/4/23.
//  Copyright © 2018年 lt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTLyricsLabel : UILabel

@property (nonatomic, assign) float progress;           /**< 当前歌词进度 范围:0-1*/

@property (nonatomic, strong) UIColor *lyricsColor;     /**< 歌词颜色 */

- (instancetype)initWithFrame:(CGRect)frame;

- (void)start;

- (void)pause;

- (void)resume;

- (void)resetProgress;

@end
