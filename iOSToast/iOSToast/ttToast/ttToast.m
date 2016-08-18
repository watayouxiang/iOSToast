//
//  ttToast.m
//  iOSToast
//
//  Created by 王涛 on 16/8/18.
//  Copyright © 2016年 wata. All rights reserved.
//

#import "ttToast.h"
#import "UIView+ttToast.h"

@implementation ttToast
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

-(void)showAboveViewController:(UIViewController *)controller{
    LayoutMargin marginZreo = {0,0,0,0};
    [controller.view addSubView:self withAILayout:AILayoutCenter layoutMargin:marginZreo];
    [NSTimer scheduledTimerWithTimeInterval:1.8 target:self selector:@selector(dismiss) userInfo:nil repeats:NO];
}

- (void)dismiss {
    [self removeFromSuperview];
}

//多行文本宽高计算
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
