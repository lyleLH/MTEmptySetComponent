//
//  UIButton+Events.h
//  GoodBusiness
//
//  Created by 刘浩 on 2020/11/4.
//  Copyright © 2020 YeahKa. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^SYTButtonActionBlock)(void);
@interface UIButton (Events)
/**
 *  UIButton添加UIControlEvents事件的block
 *
 *  @param event 事件
 *  @param action block代码
 */
- (void)syt_handleControlEvent:(UIControlEvents)event withBlock:(SYTButtonActionBlock)action;

@end

NS_ASSUME_NONNULL_END
