//
//  ttToast.m
//  iOSToast
//
//  Created by 王涛 on 16/8/18.
//  Copyright © 2016年 wata. All rights reserved.
//

#import "ttToast.h"

@implementation ttToast

+(void)showToastMessage:(NSString *)msg{
    UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
    [[[self alloc] initWithMessage:msg] showAboveView:root.view];
}

+(void)showToastMessage:(NSString *)msg aboveView:(UIView *)view{
    [[[self alloc] initWithMessage:msg] showAboveView:view];
}

-(instancetype)initWithMessage:(NSString *)msg{
    CGSize size = [self sizeOfText:msg font:[UIFont systemFontOfSize:16]];
    size.width += 20;
    size.height += 15;
    CGFloat minW = 160;
    CGFloat maxW = [UIScreen mainScreen].bounds.size.width - 20;
    size.width = size.width < minW ? minW : size.width;
    size.width = size.width > maxW ? maxW : size.width;
    
    self = [super initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    if(self) {
        self.text = msg;
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:16];
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

- (CGSize)sizeOfText:(NSString*)text font:(UIFont*)font {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *atts = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize textSize = [text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:atts context:nil].size;
    
    textSize.height = ceil(textSize.height);
    textSize.width = ceil(textSize.width);
    return textSize;
}

@end
