//
//  MTEmptySetter.m
//  MTEmptySetComponent
//
//  Created by Tom.Liu on 2021/1/26.
//

#import "MTEmptySetter.h"

NSInteger const MTEmptySetterStateAll = MTEmptySetterState_None | MTEmptySetterState_Loading | MTEmptySetterState_Empty | MTEmptySetterState_Failed;

@implementation MTEmptySetter

#pragma mark - Lifecycle
- (instancetype)init {
    if (self ==[super init]) {
        
        [self configure];
    }
    return self;
}


#pragma mark - Setter
- (void)setScrollView:(UIScrollView *)scrollView {
    
    if (scrollView && ![scrollView isKindOfClass:[UIScrollView class]]) return;
    scrollView.emptyDataSetSource = self;
    scrollView.emptyDataSetDelegate = self;
    _scrollView = scrollView;
}

- (void)setState:(MTEmptySetterState)state {
    
    //只能设置单个状态，不能设置多个状态
    BOOL singleState =  ( state == MTEmptySetterState_None ||
                        state == MTEmptySetterState_Loading ||
                        state == MTEmptySetterState_Empty ||
                        state == MTEmptySetterState_Failed );
    
    NSAssert(singleState, @"state is unavailable(do not use multiple options)");
    
    _state = state;
    [self.scrollView reloadEmptyDataSet];
    
}


- (void)configure {
    self.state = MTEmptySetterState_None;
}




@end
