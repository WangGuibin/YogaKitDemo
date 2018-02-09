//
//  NestedViewController.m
//  FlexDemo
//
//  Created by Wangguibin on 2018/2/9.
//  Copyright © 2018年 Wangguibin. All rights reserved.
//

#import "NestedViewController.h"

@interface NestedViewController ()

@end

@implementation NestedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.title = @"嵌套~";
	self.view.backgroundColor = [UIColor whiteColor];
	// 提供这种布局
	[self.view configureLayoutWithBlock:^(YGLayout * layout) {
		layout.isEnabled = YES;
		layout.justifyContent =  YGJustifyCenter; ///子元素垂直居中
		layout.alignItems   =  YGAlignCenter; // 子元素水平居中
	}];

	YGLayoutConfigurationBlock layoutBlock = ^(YGLayout *layout){
		layout.isEnabled = YES;
		layout.margin = YGPointValue(20);
		layout.flexGrow = 1;
	};

	/// 一个嵌套一个
	UIView *lastView = self.view;
	UIView *nextView = nil ;
	for (NSInteger row = 0; row < 10; row++) {
		UIView *demoView = UIView.alloc.init;
		nextView = demoView ;
		demoView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f  blue:arc4random()%256/255.0f alpha:1.0f];
		[lastView addSubview: nextView];
		[nextView configureLayoutWithBlock: layoutBlock];
		if (row == 0) {
			nextView.yoga.marginTop = YGPointValue(70);
		}
		lastView = demoView;
	}
	[self.view.yoga applyLayoutPreservingOrigin:YES];
}

@end
