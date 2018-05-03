//
//  LTLyricsTableViewCell.m
//  LTMusicPlayer
//
//  Created by lt on 2018/4/25.
//  Copyright © 2018年 lt. All rights reserved.
//

#import "LTLyricsTableViewCell.h"
#import "LTLyricsLabel.h"


@interface LTLyricsTableViewCell ()

@property (nonatomic, strong) LTLyricsLabel *lyricsLabel;

@end

@implementation LTLyricsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.lyricsLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    
    [self.lyricsLabel sizeToFit];
    self.lyricsLabel.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)resetProgress {
    [self.lyricsLabel resetProgress];
}

#pragma mark - Set

- (void)setLyricsText:(NSString *)lyricsText {
    _lyricsText = lyricsText;
    self.lyricsLabel.text = lyricsText;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setLyricsColor:(UIColor *)lyricsColor {
    _lyricsColor = lyricsColor;
    self.lyricsLabel.lyricsColor = lyricsColor;
}

- (void)setProgress:(float)progress {
    _progress = progress;
    self.lyricsLabel.progress = progress;
}

#pragma mark - Lazy get

- (LTLyricsLabel *)lyricsLabel {
    if (!_lyricsLabel) {
        _lyricsLabel = [[LTLyricsLabel alloc] initWithFrame:CGRectZero];
        _lyricsLabel.lyricsColor = [UIColor greenColor];
    }
    return _lyricsLabel;
}

@end
