//
//  ViewController.m
//  WeixinOperationMenu
//
//  Created by lan on 16/6/4.
//  Copyright © 2016年 lan. All rights reserved.
//

#import "ViewController.h"
#import "OperationMenu.h"


@interface ViewController ()

@property (nonatomic, strong) UIButton *operationButton;
@property (nonatomic, strong) OperationMenu *operationMenu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = CGRectMake(120, 105, 220, 40);
    _operationMenu = [[OperationMenu alloc] initWithFrame:frame];
    [_operationMenu setLikeButtonClickedOperation:^{
        NSLog(@"LikeButtonClicked");
    }];
    [_operationMenu setCommentButtonClickedOperation:^{
        NSLog(@"CommentButtonClicked");
    }];
    [self.view addSubview:_operationMenu];
    
    frame = CGRectMake(330, 100, 50, 50);
    _operationButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _operationButton.frame = frame;
    [_operationButton setImage:[UIImage imageNamed:@"AlbumOperateMore"] forState:UIControlStateNormal];
    [_operationButton addTarget:self action:@selector(operationButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_operationButton];
    
    
}

- (void)operationButtonClicked {
    _operationMenu.show = !_operationMenu.isShowing;
}


@end
