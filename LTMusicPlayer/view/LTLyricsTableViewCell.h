//
//  LTLyricsTableViewCell.h
//  LTMusicPlayer
//
//  Created by lt on 2018/4/25.
//  Copyright © 2018年 lt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTLyricsTableViewCell : UITableViewCell

@property (nonatomic, copy) NSString *lyricsText;

@property (nonatomic, strong) UIColor *lyricsColor;

@property (nonatomic, assign) float progress;

- (void)resetProgress;

@end
