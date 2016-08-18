//
//  ttToast.h
//  iOSToast
//
//  Created by 王涛 on 16/8/18.
//  Copyright © 2016年 wata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ttToast : UILabel
- (instancetype)initWithMessage:(NSString*)msg;
- (void)showAboveViewController:(UIViewController *)controller;

@end
