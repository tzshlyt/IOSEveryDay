//
//  HYBCircleProgressView.m
//  CircularProgress
//
//  Created by lan on 16/6/1.
//  Copyright © 2016年 lan. All rights reserved.
//

#import "HYBCircleProgressView.h"

#define kLineWidth 4

@interface HYBCircleProgressView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) CAShapeLayer *outLayer;
@property (nonatomic, strong) CAShapeLayer *progressLagyer;

@end

@implementation HYBCircleProgressView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
   
    // 设置圆角
    self.layer.cornerRadius = self.frame.size.width / 2;
    // 要设置此属性才能裁剪成圆形
    self.layer.masksToBounds = YES;
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.imageView.image = self.image;
    [self addSubview:self.imageView];
   
    CGRect rec = {
        kLineWidth / 2,
        kLineWidth / 2,
        self.frame.size.width - kLineWidth,
        self.frame.size.height - kLineWidth
    };
    
    // 根据矩形画贝塞尔曲线画圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rec];
    // 使用CAShapeLayer需要与UIBezierPath一起使用
    self.outLayer = [CAShapeLayer layer];
    // 填充颜色
    self.outLayer.fillColor = [UIColor clearColor].CGColor;
    // 画笔颜色
    self.outLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    // 线宽
    self.outLayer.lineWidth = kLineWidth;
    
    /**  线条拐角帽的样式
     *   kCALineCapButt     默认
     kCALineCapRound    轻微圆角
     kCALineCapSquare   正方形
     */
    self.outLayer.lineCap = kCALineCapRound;
    self.outLayer.path = path.CGPath;
    // 添加到父图层上
    [self.layer addSublayer:self.outLayer];
    
    
    self.progressLagyer = [CAShapeLayer layer];
    self.progressLagyer.fillColor = [UIColor clearColor].CGColor;
    self.progressLagyer.strokeColor = [UIColor redColor].CGColor;
    self.progressLagyer.lineWidth = kLineWidth;
    self.progressLagyer.lineCap = kCALineCapRound;
    self.progressLagyer.path = path.CGPath;
    [self.layer addSublayer:self.progressLagyer];
    self.progressLagyer.strokeEnd = 10/100.0;

   
    // 将整体旋转 -90度
    self.transform = CGAffineTransformMakeRotation(-M_PI_2);
    // 将图片旋转 90度
    self.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
}

- (void)setImageURL:(NSString *)url {
    // 这里直接使用文件名了
    self.image = [UIImage imageNamed:url];
}

- (void)updateProgressWithNumber:(NSUInteger)number {
    // 开始动画
    [CATransaction begin];
    // 创建了一个慢慢加速然后突然停止的方法
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    // 设置动画的时长
    [CATransaction setAnimationDuration:0.5];
    // 进度条停止的位置
    self.progressLagyer.strokeEnd = number / 100.0;
    // 提交动画
    [CATransaction commit];
}


@end
