//
//  UIScrollView+MTEmptySetComponent.m
//  MTEmptySetComponent
//
//  Created by Tom.Liu on 2021/1/26.
//

#import "UIScrollView+MTEmptySetComponent.h"
#import <objc/runtime.h>

#import "MTEmptySetter.h"

@implementation UIScrollView (MTEmptySetComponent)



- (void)setMt_emptySetter:(__kindof MTEmptySetter *)mt_emptySetter {
    if (mt_emptySetter != self.mt_emptySetter) {
        /* 只有通过setter方法或KVC方法去修改属性变量值的时候，才会触发KVO，
         * 而直接修改成员变量不会触发
         */
        [self willChangeValueForKey:NSStringFromSelector(@selector(mt_emptySetter))]; // KVO
        
        objc_setAssociatedObject(self, @selector(mt_emptySetter), mt_emptySetter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        mt_emptySetter.scrollView = self;
        
        [self didChangeValueForKey:NSStringFromSelector(@selector(mt_emptySetter))]; // KVO
    }
}


- (__kindof MTEmptySetter *)mt_emptySetter {
//    NSLog(@"%@",[objc_getAssociatedObject(self, @selector(mt_emptySetter)) description]);
    return objc_getAssociatedObject(self, @selector(mt_emptySetter));
}


@end
