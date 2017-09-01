
//
//  AFKyushuView.m
//  AFAccumulating
//
//  Created by 郑飞飞 on 2017/9/1.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//

#import "AFKyushuView.h"
#import "UIView+AFFrame.h"

@interface AFKyushuView ()


/** icon */
@property (nonatomic, strong) UIImageView *iconImage;
/** title */
@property (nonatomic, strong) UILabel *titleLabel;
/** super view */
@property (nonatomic, strong) UIView *superView;
/** override button */
@property (nonatomic, strong) UIButton *overideButton;

@end

@implementation AFKyushuView


+ (AFKyushuView *)kyushuView
{
    return [[self alloc] init];
}

/**
 * 当控件通过代码创建时，就会调用这个方法
 * 当控件通过代码创建时，想做一些初始化操作。应该在这个方法中执行
 * init方法内部会自动调用initWithFrame:方法
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    [self addSubview:self.superView];
    [self.superView addSubview:self.iconImage];
    [self.superView addSubview:self.titleLabel];
    [self.superView addSubview:self.overideButton];
}

/**
 * 当控件的尺寸发生改变的时候，会自动调用这个方法
 */
- (void)layoutSubviews
{
    // 记得必须要调用父类super方法
    [super layoutSubviews];
    
    self.superView.frame = self.bounds;
    self.overideButton.frame = self.superView.frame;
    self.iconImage.frame = CGRectMake(5, 5, self.af_width - 10, self.af_height - 30);
    self.titleLabel.frame = CGRectMake(5, 5 + _iconImage.af_height + 5, _iconImage.af_width, 20);
}


#pragma mark - lazy loading
- (UIImageView *)iconImage
{
    if (_iconImage == nil) {
        UIImageView *iconImage = [[UIImageView alloc] init];
        iconImage.backgroundColor = [UIColor purpleColor];
        _iconImage = iconImage;
    }
    return _iconImage;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:11.0];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.backgroundColor = [UIColor blueColor];
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UIView *)superView
{
    if (_superView == nil) {
        UIView *superView = [[UIView alloc] init];
        superView.backgroundColor = [UIColor darkGrayColor];
        _superView = superView;
    }
    return _superView;
}

- (UIButton *)overideButton
{
    if (_overideButton == nil) {
        UIButton *overideButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [overideButton setTitle:@"点击" forState:UIControlStateNormal];
        [overideButton addTarget:self action:@selector(overideButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _overideButton = overideButton ;
    }
    return _overideButton;
}

- (void)overideButtonClick:(UIButton *)button
{
    NSLog(@"overideButtonClick----%ld",button.tag);
    
}


/**
 * 当控件从xib\storyboard中创建完毕时，就会调用这个方法
 * 当控件从xib\storyboard中创建完毕后的初始化操作。应该在这个方法中执行
 */
- (void)awakeFromNib
{
    
}

/**
 * 当控件是通过xib\storyboard创建时，会调用这个方法来初始化控件
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}


@end
