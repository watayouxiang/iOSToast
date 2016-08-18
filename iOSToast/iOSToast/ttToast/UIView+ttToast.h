//
//  UIView+ttToast.h
//  iOSToast
//
//  Created by 王涛 on 16/8/18.
//  Copyright © 2016年 wata. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef struct {
    CGFloat top,left,bottom,right;
} LayoutMargin;

typedef NS_ENUM(NSInteger, AILayout) {
    AILayoutTop        = 1<<0,
    AILayoutCenterY    = 1<<1,
    AILayoutBottom     = 1<<2,
    AILayoutMaskY      = AILayoutTop|AILayoutCenterY|AILayoutBottom,
    
    AILayoutLeft       = 1<<3,
    AILayoutCenterX    = 1<<4,
    AILayoutRight      = 1<<5,
    AILayoutMaskX      = AILayoutLeft|AILayoutCenterX|AILayoutRight,
    
    AILayoutCenter      = AILayoutCenterX|AILayoutCenterY,
    AILayoutCenterTop   = AILayoutCenterX|AILayoutTop,
    AILayoutCenterBottom= AILayoutCenterX|AILayoutBottom,
    AILayoutCenterLeft  = AILayoutCenterY|AILayoutLeft,
    AILayoutCenterRight = AILayoutCenterY|AILayoutRight,
    AILayoutMaskAll     = AILayoutMaskX|AILayoutMaskY
};

@interface UIView (ttToast)
- (void)addSubView:(UIView*)view withAILayout:(AILayout)layout layoutMargin:(LayoutMargin)margin;

@end
