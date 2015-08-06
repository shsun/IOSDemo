//
//  ViewController.m
//  AVPlayerDemo
//
//  Created by shsun on 8/6/15.
//  Copyright (c) 2015 youdo. All rights reserved.
//

#import "ViewController.h"
//#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController () {
    
}

@property (nonatomic, retain) UIView                        *displayView;
@property (nonatomic, retain) NSURL                         *url;
@property (nonatomic, retain) AVPlayer                      *player;
@property (nonatomic, retain) AVPlayerLayer                 *playerLayer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSString *URL = @"http://211.151.146.65:8080/wlantest/shanghai_sun/Cherry/22minutes.mp4";
    URL = @"http://www.gomplayer.jp/img/sample/mp4_h264_aac.mp4";

    URL = @"http://211.151.146.65:8080/wlantest/shanghai_sun/p.mp4";
    
    self.url = [NSURL URLWithString:URL];

    self.player = [AVPlayer playerWithPlayerItem:[AVPlayerItem playerItemWithURL:self.url]];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    
    
    //[self.player addObserver:self forKeyPath:@"rate" options:0 context:nil];
    //[[self.player currentItem] addObserver:self forKeyPath:@"status" options:0 context:nil];
    //[[self.player currentItem] addObserver:self forKeyPath:@"loadedTimeRanges" options:0 context:nil];
    //[[self.player currentItem] addObserver:self forKeyPath:@"playbackBufferEmpty" options:0 context:nil];
    //[[self.player currentItem] addObserver:self forKeyPath:@"playbackBufferFull" options:0 context:nil];
    //[[self.player currentItem] addObserver:self forKeyPath:@"playbackLikelyToKeepUp" options:0 context:nil];
    //[self.playerLayer addObserver:self forKeyPath:@"readyForDisplay" options:0 context:nil];
	
    //
    self.displayView = [[UIView alloc] initWithFrame:CGRectMake(10, 50, 200, 300)];
    self.playerLayer.frame = self.displayView.bounds;
    self.displayView.backgroundColor = [UIColor greenColor];
    [[self.displayView layer] addSublayer:self.playerLayer];
    
    [self.view addSubview:self.displayView];
    [self.player play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
