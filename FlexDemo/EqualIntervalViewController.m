//
//  EqualIntervalViewController.m
//  FlexDemo
//
//  Created by Wangguibin on 2018/2/9.
//  Copyright © 2018年 Wangguibin. All rights reserved.
//

#import "EqualIntervalViewController.h"

@interface EqualIntervalViewController ()

@end

@implementation EqualIntervalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.title = @"固定大小等间距";
	self.view.backgroundColor = [UIColor whiteColor];

	// 提供这种布局
	[self.view configureLayoutWithBlock:^(YGLayout * layout) {
		layout.isEnabled = YES;
		layout.justifyContent =  YGJustifyCenter; ///子元素垂直居中
		layout.paddingVertical =  YGPointValue(100); // 顶部内边距
		layout.flexDirection = YGFlexDirectionColumn;
//		layout.alignItems   =  YGAlignCenter; // 子元素水平居中
	}];

	YGLayoutConfigurationBlock layoutBlock =^(YGLayout *layout) {
		layout.isEnabled = YES;
		layout.height= YGPointValue(200);
		layout.marginVertical = YGPointValue(15);//垂直间距
		layout.alignItems = YGAlignCenter; // 子元素水平居中
		layout.paddingHorizontal = YGPointValue(5);
		layout.flexDirection = YGFlexDirectionRow ;
	};

	UIView *topView = [UIView new];
	topView.backgroundColor = RGB(40, 187, 33);
	[self.view addSubview: topView];
	UIView *bottomView = [UIView new];
	bottomView.backgroundColor = RGB(219, 81, 215);
	[self.view addSubview: bottomView];
	[topView configureLayoutWithBlock: layoutBlock];
	[bottomView configureLayoutWithBlock: layoutBlock];
	[self.view.yoga applyLayoutPreservingOrigin: YES];

	YGLayoutConfigurationBlock layoutBlock001 =^(YGLayout *layout) {
		layout.isEnabled = YES;
		layout.height= YGPointValue(100);
		layout.marginHorizontal= YGPointValue(15);//垂直间距
		layout.flexGrow = 1;
	};

	UIView *oneView = UIView.alloc.init;
	oneView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f  blue:arc4random()%256/255.0f alpha:1.0f];;
	[bottomView addSubview: oneView];

	UIView *twoView = UIView.alloc.init;
	twoView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f  blue:arc4random()%256/255.0f alpha:1.0f];;
	[bottomView addSubview: twoView];
	[oneView configureLayoutWithBlock: layoutBlock001];
	[twoView configureLayoutWithBlock: layoutBlock001];
	[bottomView.yoga applyLayoutPreservingOrigin: YES];

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
