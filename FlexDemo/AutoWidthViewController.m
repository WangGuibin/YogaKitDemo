//
//  AutoWidthViewController.m
//  FlexDemo
//
//  Created by Wangguibin on 2018/2/9.
//  Copyright © 2018年 Wangguibin. All rights reserved.
//

#import "AutoWidthViewController.h"

@interface AutoWidthViewController ()

@end

@implementation AutoWidthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.title = @"等间距自动定宽";
	self.view.backgroundColor = [UIColor whiteColor];

	[self.view configureLayoutWithBlock:^(YGLayout *layout) {
		layout.isEnabled = YES;
	}];
	UIScrollView *scrollView = [[UIScrollView alloc] init] ;
	scrollView.backgroundColor = [UIColor grayColor];
	[scrollView configureLayoutWithBlock:^(YGLayout *layout) {
		layout.isEnabled = YES;
		layout.flexDirection = YGFlexDirectionColumn;
		layout.height = YGPointValue(self.view.bounds.size.height);
	}];
	[self.view addSubview:scrollView];


	UIView *container =[UIView new];
	container.backgroundColor = [UIColor cyanColor];
	[scrollView addSubview: container];
	[container configureLayoutWithBlock:^(YGLayout * layout) {
		layout.isEnabled = YES;
		layout.justifyContent =  YGJustifySpaceBetween;
		layout.alignItems     =  YGAlignCenter;
		layout.paddingVertical = YGPointValue(20);
	}];

	for ( int i = 1 ; i <= 10 ; ++i )
	  {
		UIView *item = [UIView new];
		item.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5
										  brightness:( arc4random() % 128 / 256.0 ) + 0.5
											   alpha:1];
		[item  configureLayoutWithBlock:^(YGLayout *layout) {
			layout.isEnabled = YES;
			layout.marginTop = YGPointValue(15);
			layout.height     = YGPointValue(10*i);
			layout.width      = YGPointValue(10*i);
		}];
		[container addSubview: item];
	  }
	[self.view.yoga applyLayoutPreservingOrigin: YES];
	// 布局之后才知道 有多少逼数~
	scrollView.contentSize = container.bounds.size;

}


@end
