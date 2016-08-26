//
//  ttToast.m
//  iOSToast
//
//  Created by 王涛 on 16/8/18.
//  Copyright © 2016年 wata. All rights reserved.
//

#import "ttToast.h"

#define minWidth 160
#define textFont [UIFont systemFontOfSize:16]
#define padding (UIEdgeInsetsMake(5, 5, 5, 5))
#define margin (UIEdgeInsetsMake(10, 10, 10, 10))

@implementation ttToast

+(void)showToastMessage:(NSString *)message{
    UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
    [[[self alloc] initWithMessage:message] showAboveView:root.view];
}

-(instancetype)initWithMessage:(NSString *)msg{
    CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width-margin.left-margin.right-padding.left-padding.right, [UIScreen mainScreen].bounds.size.height-margin.top-margin.bottom-padding.top-padding.bottom);
    CGSize size = [msg boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: textFont} context:nil].size;
    
    size.width += (margin.left + margin.right);
    size.height += (margin.top + margin.bottom);
    size.width = size.width < minWidth ? minWidth : size.width;
    self = [super initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    if(self) {
        self.numberOfLines = 0;
        self.text = msg;
        self.textAlignment = NSTextAlignmentCenter;
        self.font = textFont;
        self.textColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4;
    }
    return self;
}

-(void)showAboveView:(UIView *)view{
    [view addSubview:self];
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.frame.size.height]];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.frame.size.width]];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [view addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
}

- (void)dismiss {
    [self removeFromSuperview];
}

-(void)drawTextInRect:(CGRect)rect{
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, margin)];
}

@end
