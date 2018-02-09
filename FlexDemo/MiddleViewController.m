//
//  MiddleViewController.m
//  FlexDemo
//
//  Created by Wangguibin on 2018/2/8.
//  Copyright © 2018年 Wangguibin. All rights reserved.
//

#import "MiddleViewController.h"

@interface MiddleViewController ()

@end

@implementation MiddleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.title = @"居中";
	self.view.backgroundColor = [UIColor whiteColor];
	[self.view configureLayoutWithBlock:^(YGLayout * layout) {
		layout.isEnabled = YES;
		layout.justifyContent =  YGJustifyCenter; ///子元素垂直居中
		layout.alignItems   =  YGAlignCenter; // 子元素水平居中
	}];
	UIView *redView = UIView.alloc.init;
	redView.backgroundColor = [UIColor redColor];
	[self.view addSubview: redView];

	// 固定大小
	[redView configureLayoutWithBlock:^(YGLayout * layout) {
		layout.isEnabled = YES;
		layout.width=  YGPointValue(200);
		layout.height = YGPointValue(200);
	}];
		// 刷新 至关重要的一个操作
	[self.view.yoga applyLayoutPreservingOrigin: YES];

	// 加个动画搞搞
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[UIView animateWithDuration:1 animations:^{
			[redView configureLayoutWithBlock:^(YGLayout * layout) {
				layout.isEnabled = YES;
				layout.width=  YGPointValue(375);
				layout.height = YGPointValue(667);
			}];
			[self.view.yoga applyLayoutPreservingOrigin: YES];
		} completion:^(BOOL finished) {
			[UIView  animateWithDuration:1 animations:^{
				[redView configureLayoutWithBlock:^(YGLayout * layout) {
					layout.isEnabled = YES;
					layout.width=  YGPointValue(375);
					layout.height = YGPointValue(375);
				}];
				[self.view.yoga applyLayoutPreservingOrigin: YES];
			}];
		}];
	});

}


#pragma mark- 屏幕旋转之后保持相对布局不变
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
	[super viewWillTransitionToSize:size withTransitionCoordinator: coordinator];
	[self.view configureLayoutWithBlock:^(YGLayout * layout) {
		layout.width = YGPointValue(size.width);
		layout.height = YGPointValue(size.height);
	}];
	[self.view.yoga applyLayoutPreservingOrigin: YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
