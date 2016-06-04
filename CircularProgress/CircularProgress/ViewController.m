//
//  ViewController.m
//  CircularProgress
//
//  Created by lan on 16/6/1.
//  Copyright © 2016年 lan. All rights reserved.
//

#import "ViewController.h"
#import "HYBCircleProgressView.h"

@interface ViewController ()

@property (nonatomic, strong)HYBCircleProgressView *progressView;
@property (nonatomic, strong)NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.progressView = [[HYBCircleProgressView alloc] init];
    self.progressView.frame = CGRectMake(100, 100, 200, 200);
    [self.progressView setImageURL:@"image"];
    [self.view addSubview:self.progressView];
  
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                  target:self
                                                selector:@selector(updateCircle)
                                                userInfo:nil repeats:YES];
    
}

- (void) updateCircle {
    static float i = 0;
    [self.progressView updateProgressWithNumber:i];
    i += 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
