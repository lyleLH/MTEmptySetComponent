//
//  UIScrollView+MTEmptySetComponent.h
//  MTEmptySetComponent
//
//  Created by Tom.Liu on 2021/1/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MTEmptySetter;

@interface UIScrollView (MTEmptySetComponent)

/** 空白状态配置项，使用关联对象为UIScrollView分类添加的属性*/

@property (nonatomic,strong) __kindof MTEmptySetter *mt_emptySetter;


@end

NS_ASSUME_NONNULL_END
