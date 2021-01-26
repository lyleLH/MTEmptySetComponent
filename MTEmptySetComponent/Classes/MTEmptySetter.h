//
//  MTEmptySetter.h
//  MTEmptySetComponent
//
//  Created by Tom.Liu on 2021/1/26.
//

#import <Foundation/Foundation.h>

#if __has_include(<DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>)
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#else
#import "UIScrollView+EmptyDataSet.h"
#endif


/**数据加载的状态*/
typedef NS_OPTIONS(NSUInteger, MTEmptySetterState) {
    MTEmptySetterState_None     = 1 << 0, //有数据、闲置、未启用
    MTEmptySetterState_Loading  = 1 << 1, //加载中
    MTEmptySetterState_Empty    = 1 << 2, //数据空
    MTEmptySetterState_Failed   = 1 << 3, //加载失败
};

NS_ASSUME_NONNULL_BEGIN

/**所有状态*/
FOUNDATION_EXTERN NSInteger const MTEmptySetterStateAll;

@interface MTEmptySetter : NSObject <DZNEmptyDataSetDelegate, DZNEmptyDataSetSource>

@property (nonatomic,weak) UIScrollView *scrollView;

@property (nonatomic,assign) MTEmptySetterState state;

/**初始化配置 子类override父类的方法时，必须在方法内部调用super的这个方法*/
- (void)configure NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
