//
//  ViewController.m
//  LTMusicPlayer
//
//  Created by lt on 2018/4/23.
//  Copyright © 2018年 lt. All rights reserved.
//

#import "ViewController.h"
#import "LTLyricsLabel.h"
#import "LTMusicManager.h"

@interface ViewController ()

@property (nonatomic, strong) LTLyricsLabel *ltLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.ltLabel = [[LTLyricsLabel alloc] initWithFrame:CGRectZero];
    self.ltLabel.center = self.view.center;
    [self.view addSubview:self.ltLabel];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"start" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(60, 60, 40, 40);
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"pause" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(120, 60, 40, 40);
    [button addTarget:self action:@selector(animationPause) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"resume" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(180, 60, 40, 40);
    [button addTarget:self action:@selector(animationResume) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [LTMusicManager sharedInstance];
}


- (void)buttonClicked {
    
    [self.ltLabel start];
    
}

- (void)animationPause {
    
    [self.ltLabel pause];
    
}

- (void)animationResume {
    
    [self.ltLabel resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
