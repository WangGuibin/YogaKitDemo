//
//  ViewController.m
//  FlexDemo
//
//  Created by Wangguibin on 2018/2/8.
//  Copyright © 2018年 Wangguibin. All rights reserved.
//

#import "ViewController.h"
#import "MiddleViewController.h"
#import "NestedViewController.h"
#import "EqualIntervalViewController.h"
#import "AutoWidthViewController.h"



@interface ViewController ()

@property (nonatomic,strong) UIView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.navigationItem.title = @"YogaKit的Demo";
	[self.view configureLayoutWithBlock:^(YGLayout *layout) {
		layout.isEnabled = YES;
		layout.justifyContent =  YGJustifyCenter;
		layout.alignItems     =  YGAlignStretch;
	}];

	UIScrollView *scrollView = [[UIScrollView alloc] init] ;
	scrollView.backgroundColor = [UIColor grayColor];
	[scrollView configureLayoutWithBlock:^(YGLayout *layout) {
		layout.isEnabled = YES;
		layout.flexDirection = YGFlexDirectionColumn;
		layout.height = YGPointValue(self.view.bounds.size.height);
	}];
	[self.view addSubview:scrollView];

	self.containerView = [[UIView alloc] initWithFrame:self.view.bounds];
	self.containerView.backgroundColor = [UIColor whiteColor];
	[scrollView addSubview: self.containerView];

	[self.containerView configureLayoutWithBlock:^(YGLayout * layout) {
		layout.isEnabled = YES;
		layout.alignItems  =  YGAlignCenter;
	}];

	NSArray *buttonTitles = @[@"居中",@"嵌套",@"固定大小等间距",@"等间距自动定宽",@"滚动视图计算滚动区域"];
	NSArray *bgColors =
	@[
	  RGB(219, 81, 215),
	  RGB(252, 153, 82),
	  RGB(40, 187, 33),
	  RGB(92, 218, 224),
	  RGB(252, 70, 86)
	  ];
	for (NSInteger index = 0; index < buttonTitles.count ; index++) {
		UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
		button.tag = index ;
		[button setTitle: buttonTitles[index] forState:UIControlStateNormal];
		button.backgroundColor = bgColors[index];
		[button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
		[self.containerView addSubview: button];
		[button configureLayoutWithBlock:^(YGLayout * layout) {
			layout.isEnabled = YES;
			layout.width = YGPointValue(300); //YGPointValue 自定义的结构体 
			layout.height = YGPointValue(44);
			layout.marginVertical = YGPointValue(20);
			layout.flexGrow = index; //某一方向上的宽度或者高度按比例分配父View剩余空间
//			layout.flexShrink = 1; //某一方向上的宽度或者高度 超出父view才起缩放作用
			layout.flexBasis = YGPointValue(200);// 某一方向上的宽度或者高度的绝对优先级
		}];
	}
	[self.view.yoga applyLayoutPreservingOrigin: YES];
	scrollView.contentSize = self.containerView.bounds.size;
}

- (void)buttonAction:(UIButton *)button{
	NSArray *classNames = @[@"MiddleViewController",@"NestedViewController",@"EqualIntervalViewController",@"AutoWidthViewController",@"ViewController"];
	if (button.tag < classNames.count ) {
		[self pushVC: classNames[button.tag]];
	}
}

- (void)pushVC:(NSString * )classVCName {
	UIViewController *VC = [[NSClassFromString(classVCName) alloc] init];
	[self.navigationController pushViewController:VC animated:YES];
}
@end
