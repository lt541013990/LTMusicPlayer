//
//  LTLyricsView.m
//  LTMusicPlayer
//
//  Created by lt on 2018/4/25.
//  Copyright © 2018年 lt. All rights reserved.
//

#import "LTLyricsView.h"
#import "LTLyricsTableViewCell.h"

NSString *CELLKEY = @"lyricsCell";

@interface LTLyricsView() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation LTLyricsView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.tableView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LTNotifactionAction:) name:@"LTMusicNotifaction" object:nil];
    }
    return self;
}

- (void)layoutSubviews {
    
    self.tableView.frame = self.bounds;
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification

- (void)LTNotifactionAction: (NSNotification *)notification {
    
    
    
}

#pragma mark - UITableViewDelegate & Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LTLyricsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLKEY];
    cell.lyricsColor = [UIColor greenColor];
    cell.lyricsText = @"好运来 我们好运来";
    
    return cell;
}

#pragma mark - Lazy get

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[LTLyricsTableViewCell class] forCellReuseIdentifier:CELLKEY];
    }
    return _tableView;
}

@end
