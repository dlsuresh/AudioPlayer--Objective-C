//
//  ViewController.m
//  AudioPlayer
//
//  Created by Suresh on 2/17/17.
//  Copyright © 2017 Suresh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    AVAudioPlayer *player;
    
    BOOL isPlaying;
    
    NSArray *songArray;
    
    NSInteger index;
    
    NSArray *songImage;
    
    NSArray *songName;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    songImage = @[@"balaya.jpg",@"balayya.jpg",@"chiru.jpeg",@"druva.jpg",@"nani.jpg",@"nenulocal.jpg"];
   
    songArray = @[@"Saaho",@"Gana",@"Sundari",@"choosa",@"disturb",@"sideplease"];
    
    songName = @[@"01 - gautamiputra Satakarni [www.AtoZmp3.in]",@"02 -gautamiputra Satakarni [www.AtoZmp3.in]",@"03 - Khaidhi No:150 ",@"04 - Druvaa (2017)",@"05 - Disturb Chestha Ninnu [www.AtoZmp3.in]",@"06 - Side Please [www.AtoZmp3.in]"];
    
    index = 0;
    
    self.sliderSong.value = 0;
    [self playSong];
    
    self.timeLabel.text =@"0.0" ; self.timeLabelFull.text = @"0.0";

    
}

-(void)playSong{
    
    NSError *error;

    NSString *file = [[NSBundle mainBundle]pathForResource:[songArray objectAtIndex:index] ofType:@".mp3"];
    
    NSURL *songUrl = [NSURL URLWithString:file];
    
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:songUrl error:&error];
    
    self.img.image = [UIImage imageNamed:[songImage objectAtIndex:index]];
    
    self.sliderSong.minimumValue = 0.0;
    self.sliderSong.maximumValue = player.duration;
    self.nameLabel.text = [songName objectAtIndex:index];
    
    
//    self.img.image = [UIImage imageWithDat]
   // player.currentTime = self.sliderSong.value;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
- (IBAction)playSong:(id)sender {

    if (isPlaying) {
        
        UIImage *btnImage = [UIImage imageNamed:@"play.png"];
        [self.playIcon setImage:btnImage forState:UIControlStateNormal];
        [player pause];
        isPlaying = NO;
    }else {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
        UIImage *btnImage = [UIImage imageNamed:@"pause.png"];
        [self.playIcon setImage:btnImage forState:UIControlStateNormal];
        [player play];
        [self timer];
        isPlaying =YES;
    }
    

}


- (IBAction)nextSong:(id)sender {
    index++;

    if (index > songArray.count - 1) {
        index= 0;
        [self startFromBegining];
        [self playSong];
        [player play];
    }else{
    [self startFromBegining];
    [self playSong];
    [player play];
    }
    
}
- (IBAction)prevSog:(id)sender {
    index--;
    if (index < 0) {
        index = songArray.count-1;
        [self playSong];
        [self startFromBegining];
        [player play];
    }else{
        
    
    [self playSong];
    [self startFromBegining];
    [player play];
    
    }
}

- (IBAction)slider:(id)sender {
    
    player.volume = [(UISlider *)sender value];
}

-(void)startFromBegining{
    
    player.currentTime = 0;
    [player play];
}

-(NSString *)timeFormat:(float)value{
    
    float minutes = floor(value/60);
    float seconds = value-(minutes)*60;
    
    NSString *time = [NSString stringWithFormat:@"%0.00f:%0.00f",minutes,seconds];
   
    return time;
    
    
    
}
    



-(void)updateTimer:(NSTimer *)timer{

    self.sliderSong.value = player.currentTime;
    
    self.timeLabel.text = [NSString stringWithFormat:@"%@ ",[self timeFormat:player.currentTime]];
    
    self.timeLabelFull.text = [NSString stringWithFormat:@"-%@",[self timeFormat:player.duration- player.currentTime]];
    
    [self.sliderSong setValue:player.currentTime animated:YES];

    
}


- (IBAction)SongSlide:(id)sender {
    player.currentTime = self.sliderSong.value;
    
    
    
}



- (IBAction)stop:(id)sender {
    [self startFromBegining];
    //index = 0;

    [player stop];
    isPlaying = NO;
}
@end
