//
//  OperationMenu.m
//  WeixinOperationMenu
//
//  Created by lan on 16/6/4.
//  Copyright © 2016年 lan. All rights reserved.
//

#import "OperationMenu.h"
@interface OperationMenu ()
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UIView *centerLine;
@property (nonatomic, assign) CGRect rect;
@end

@implementation OperationMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        self.rect = frame;
    }
    return self;
}

- (void)setup {
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor colorWithRed:69/255.0 green:74/255.0 blue:76/255.0 alpha:1];
    
    CGRect fram = CGRectMake(0, 0, 110, 40);
    _likeButton = [self creatButtonWithTitle:@"赞" image:[UIImage imageNamed:@"AlbumLike"] selImage:[UIImage imageNamed:@""] target:self selector:@selector(likeButtonClicked)];
    _likeButton.frame = fram;
    [self addSubview:_likeButton];
    
    fram = CGRectMake(111, 0, 110, 40);
    _commentButton = [self creatButtonWithTitle:@"评论" image:[UIImage imageNamed:@"AlbumComment"] selImage:[UIImage imageNamed:@""] target:self selector:@selector(commentButtonClicked)];
    _commentButton.frame = fram;
    [self addSubview:_commentButton];
    
    fram = CGRectMake(110, 5, 1, 30);
    _centerLine = [[UIView alloc] initWithFrame:fram];
    _centerLine.backgroundColor = [UIColor grayColor];
    [self addSubview:_centerLine];
    
}

- (UIButton *)creatButtonWithTitle:(NSString *)title image:(UIImage *)image selImage:(UIImage *)selImage target:(id)target selector:(SEL)sel
{
    UIButton *btn = [UIButton new];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selImage forState:UIControlStateSelected];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
    return btn;
}

- (void)likeButtonClicked
{
    if (self.likeButtonClickedOperation) {
        self.likeButtonClickedOperation();
    }
}

- (void)commentButtonClicked
{
    if (self.commentButtonClickedOperation) {
        self.commentButtonClickedOperation();
    }
    self.show = NO;
}

- (void)setShow:(BOOL)show {
    _show = show;
     [UIView animateWithDuration:0.2 animations:^{
        if (!show) {
            self.frame = CGRectMake(self.rect.origin.x + self.rect.size.width, self.rect.origin.y, 0, self.rect.size.height);
        }else {
            self.frame = self.rect;
        }
     }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
