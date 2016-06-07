//
//  OperationMenu.h
//  WeixinOperationMenu
//
//  Created by lan on 16/6/4.
//  Copyright © 2016年 lan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OperationMenu : UIView

@property (nonatomic, assign, getter = isShowing) BOOL show;

@property (nonatomic, copy) void (^likeButtonClickedOperation)();
@property (nonatomic, copy) void (^commentButtonClickedOperation)();

@end
