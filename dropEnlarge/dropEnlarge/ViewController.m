//
//  ViewController.m
//  dropEnlarge
//
//  Created by lan on 16/7/1.
//  Copyright © 2016年 lan. All rights reserved.
//

#import "ViewController.h"

#define  ImageHight 200.0f
#define  TableviewCellHeight  70

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) UIImageView *zoomImageView;
@property (nonatomic, strong) UIImageView *circleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableview.rowHeight = TableviewCellHeight;
    _tableview.dataSource = self;
    _tableview.delegate = self;
    _tableview.contentInset = UIEdgeInsetsMake(ImageHight + TableviewCellHeight, 0, 0, 0);
    
    CGRect frame = CGRectMake(0, -ImageHight - TableviewCellHeight, self.view.frame.size.width, ImageHight);
    _zoomImageView = [[UIImageView alloc] initWithFrame:frame];
    _zoomImageView.image = [UIImage imageNamed:@"image"];
    // 设置ImageView 内容模式
    _zoomImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [_tableview addSubview:_zoomImageView];
   
    
    frame = CGRectMake(10, ImageHight-90, 80, 80);
    _circleView = [[UIImageView alloc] initWithFrame:frame];
    _circleView.image = [UIImage imageNamed:@"image1"];
    
    // 剪切成圆形
    _circleView.layer.cornerRadius = 40;
    _circleView.clipsToBounds = YES;
    
    // 距离顶部距离可变，底部固定
    _circleView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    [_zoomImageView addSubview:_circleView];
    
    // 毛玻璃效果
//    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
//    effectView.frame = CGRectMake(0,0 , _zoomImageView.frame.size.width, _zoomImageView.frame.size.height+TableviewCellHeight);
//    [_zoomImageView addSubview:effectView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = scrollView.contentOffset.y;
    if (y < -ImageHight) {
        CGRect frame = self.zoomImageView.frame;
        frame.origin.y = y;
        frame.size.height = -y;
        self.zoomImageView.frame = frame;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}



@end
