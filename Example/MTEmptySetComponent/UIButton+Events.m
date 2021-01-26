//
//  UIButton+Events.m
//  GoodBusiness
//
//  Created by 刘浩 on 2020/11/4.
//  Copyright © 2020 YeahKa. All rights reserved.
//

#import "UIButton+Events.h"
#import <objc/runtime.h>

@implementation UIButton (Events)
static char eventKey;

/**
 *  UIButton添加UIControlEvents事件的block
 *
 *  @param event 事件
 *  @param action block代码
 */
- (void)syt_handleControlEvent:(UIControlEvents)event withBlock:(SYTButtonActionBlock)action {
    objc_setAssociatedObject(self, &eventKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}

- (void)callActionBlock:(id)sender {
    SYTButtonActionBlock block = (SYTButtonActionBlock)objc_getAssociatedObject(self, &eventKey);
    if (block) {
        block();
    }
}

@end
