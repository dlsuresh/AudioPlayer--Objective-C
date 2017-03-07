//
//  ViewController.h
//  AudioPlayer
//
//  Created by Suresh on 2/17/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *play;
@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;
@property (weak, nonatomic) IBOutlet UISlider *songSlide;

- (IBAction)SongSlide:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *sliderSong;
@property (strong, nonatomic) IBOutlet NSTimer *timer;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabelFull;
@property (weak, nonatomic) IBOutlet UIImageView *img;
- (IBAction)stop:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *playIcon;

@end

