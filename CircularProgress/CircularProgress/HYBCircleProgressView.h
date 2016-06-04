//
//  HYBCircleProgressView.h
//  CircularProgress
//
//  Created by lan on 16/6/1.
//  Copyright © 2016年 lan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYBCircleProgressView : UIView

// 设置图片
- (void)setImageURL:(NSString *)url;

// 更新进度
- (void)updateProgressWithNumber:(NSUInteger)number;

@end
