//
//  MTGeneralEmptySetter.m
//  MTEmptySetComponent
//
//  Created by Tom.Liu on 2021/1/26.
//

#import "MTGeneralEmptySetter.h"


@interface MTGeneralEmptySetter ()

/**记录不同页空状态的配置*/
@property (nonatomic, strong) NSMutableDictionary   *titles;
@property (nonatomic, strong) NSMutableDictionary   *descriptions;
@property (nonatomic, strong) NSMutableDictionary   *images;
@property (nonatomic, strong) NSMutableDictionary   *imageTintColors;
@property (nonatomic, strong) NSMutableDictionary   *imageAnimations;
@property (nonatomic, strong) NSMutableDictionary   *buttonTitles;
@property (nonatomic, strong) NSMutableDictionary   *buttonImages;
@property (nonatomic, strong) NSMutableDictionary   *buttonBackgroundImages;
@property (nonatomic, strong) NSMutableDictionary   *backgroundColors;
@property (nonatomic, strong) NSMutableDictionary   *customViews;
@property (nonatomic, strong) NSMutableDictionary   *verticalOffsets;
@property (nonatomic, strong) NSMutableDictionary   *spaceHeights;

@property (nonatomic, strong) NSMutableDictionary   *fadeInSet;
@property (nonatomic, strong) NSMutableDictionary   *displaySet;
@property (nonatomic, strong) NSMutableDictionary   *forcedToDisplaySet;
@property (nonatomic, strong) NSMutableDictionary   *touchableSet;
@property (nonatomic, strong) NSMutableDictionary   *scrollableSet;
@property (nonatomic, strong) NSMutableDictionary   *animateSet;
@property (nonatomic, strong) NSMutableDictionary   *tapButtonHandlers;
@property (nonatomic, strong) NSMutableDictionary   *tapViewHandlers;

@property (nonatomic, strong) NSMutableDictionary   *titleFonts;
@property (nonatomic, strong) NSMutableDictionary   *titleColors;
@property (nonatomic, strong) NSMutableDictionary   *descriptionFonts;
@property (nonatomic, strong) NSMutableDictionary   *descriptionColors;
@property (nonatomic, strong) NSMutableDictionary   *buttonTitleFonts;
@property (nonatomic, strong) NSMutableDictionary   *buttonTitleColors;
@end


@implementation MTGeneralEmptySetter

#pragma mark - Lifecycle
- (void)configure {
    
    [super configure];
    
    //初始化
    self.titles = [NSMutableDictionary dictionary];
    self.descriptions = [NSMutableDictionary dictionary];
    self.images = [NSMutableDictionary dictionary];
    self.imageTintColors = [NSMutableDictionary dictionary];
    self.imageAnimations = [NSMutableDictionary dictionary];
    self.buttonTitles = [NSMutableDictionary dictionary];
    self.buttonImages = [NSMutableDictionary dictionary];
    self.buttonBackgroundImages = [NSMutableDictionary dictionary];
    self.backgroundColors = [NSMutableDictionary dictionary];
    self.customViews = [NSMutableDictionary dictionary];
    self.verticalOffsets = [NSMutableDictionary dictionary];
    self.spaceHeights = [NSMutableDictionary dictionary];
    
    self.fadeInSet = [NSMutableDictionary dictionary];
    self.displaySet = [NSMutableDictionary dictionary];
    self.forcedToDisplaySet = [NSMutableDictionary dictionary];
    self.touchableSet = [NSMutableDictionary dictionary];
    self.scrollableSet = [NSMutableDictionary dictionary];
    self.animateSet = [NSMutableDictionary dictionary];
    self.tapButtonHandlers = [NSMutableDictionary dictionary];
    self.tapViewHandlers = [NSMutableDictionary dictionary];
    
    self.titleFonts = [NSMutableDictionary dictionary];
    self.titleColors = [NSMutableDictionary dictionary];
    self.descriptionFonts = [NSMutableDictionary dictionary];
    self.descriptionColors = [NSMutableDictionary dictionary];
    self.buttonTitleFonts = [NSMutableDictionary dictionary];
    self.buttonTitleColors = [NSMutableDictionary dictionary];
    
    //设置默认值
    self.fadeIn = YES;
    self.display = YES;
    self.forcedToDisplay = NO;
    self.touchable = YES;
    self.scrollable = YES;
    self.animate = NO;
}

#pragma mark - Public
- (void)setTitle:(NSString *)title forState:(MTEmptySetterState)state {
    if (!title) {
        [self setObject:nil inDictionary:self.titles forState:state];
        return;
    }
    NSAttributedString *string = [self attributedStringWithString:title useFonts:self.titleFonts andColors:self.titleColors forState:state];
    [self setObject:string inDictionary:self.titles forState:state];
}

- (void)setAttributedTitle:(NSAttributedString *)title forState:(MTEmptySetterState)state {
    [self setObject:title inDictionary:self.titles forState:state];
}

- (void)setDescription:(NSString *)description forState:(MTEmptySetterState)state {
    if (!description) {
        [self setObject:nil inDictionary:self.descriptions forState:state];
    }
    NSAttributedString *string = [self attributedStringWithString:description useFonts:self.descriptionFonts andColors:self.descriptionColors forState:state];
    [self setObject:string inDictionary:self.descriptions forState:state];
}

- (void)setAttributedDescription:(NSAttributedString *)description forState:(MTEmptySetterState)state {
    [self setObject:description inDictionary:self.descriptions forState:state];
}

- (void)setImage:(UIImage *)image forState:(MTEmptySetterState)state {
    [self setObject:image inDictionary:self.images forState:state];
}

- (void)setImageTintColor:(UIColor *)color forState:(MTEmptySetterState)state {
    [self setObject:color inDictionary:self.imageTintColors forState:state];
}

- (void)setImageAnimation:(CAAnimation *)animation forState:(MTEmptySetterState)state {
    [self setObject:animation inDictionary:self.imageAnimations forState:state];
}

- (void)setButtonTitle:(NSString *)title controlState:(UIControlState)cState forState:(MTEmptySetterState)state {
    if (!title) {
        [self setObject:nil inDictionary:self.buttonTitles forState:state];
        return;
    }
    NSAttributedString *string = [self attributedStringWithString:title useFonts:self.buttonTitleFonts andColors:self.buttonTitleColors forState:state];
    [self setObject:string forControlState:cState inDictionary:self.buttonTitles forState:state];
}

- (void)setAttributedButtonTitle:(NSAttributedString *)title controlState:(UIControlState)cState forState:(MTEmptySetterState)state {
    [self setObject:title forControlState:cState inDictionary:self.buttonTitles forState:state];
}

- (void)setButtonImage:(UIImage *)image controlState:(UIControlState)cState forState:(MTEmptySetterState)state {
    [self setObject:image forControlState:cState inDictionary:self.buttonImages forState:state];
}

- (void)setButtonBackgroundImage:(UIImage *)image controlState:(UIControlState)cState forState:(MTEmptySetterState)state {
    [self setObject:image forControlState:cState inDictionary:self.buttonBackgroundImages forState:state];
}

- (void)setBackgroundColor:(UIColor *)color forState:(MTEmptySetterState)state {
    [self setObject:color inDictionary:self.backgroundColors forState:state];
}

- (void)setCustomView:(UIView *)view forState:(MTEmptySetterState)state {
    [self setObject:view inDictionary:self.customViews forState:state];
}

- (void)setVerticalOffset:(CGFloat)offset forState:(MTEmptySetterState)state {
    [self setObject:@(offset) inDictionary:self.verticalOffsets forState:state];
}

- (void)setSpaceHeight:(CGFloat)space forState:(MTEmptySetterState)state {
    [self setObject:@(space) inDictionary:self.spaceHeights forState:state];
}

- (void)setFadeIn:(BOOL)fadeIn forState:(MTEmptySetterState)state {
    [self setObject:@(fadeIn) inDictionary:self.fadeInSet forState:state];
}

- (void)setDisplay:(BOOL)display forState:(MTEmptySetterState)state {
    [self setObject:@(display) inDictionary:self.displaySet forState:state];
}

- (void)setForcedToDisplay:(BOOL)forcedToDisplay forState:(MTEmptySetterState)state {
    [self setObject:@(forcedToDisplay) inDictionary:self.forcedToDisplaySet forState:state];
}

- (void)setTouchable:(BOOL)touchable forState:(MTEmptySetterState)state {
    [self setObject:@(touchable) inDictionary:self.touchableSet forState:state];
}

- (void)setScrollable:(BOOL)scrollable forState:(MTEmptySetterState)state {
    [self setObject:@(scrollable) inDictionary:self.scrollableSet forState:state];
}

- (void)setAnimate:(BOOL)animate forState:(MTEmptySetterState)state {
    [self setObject:@(animate) inDictionary:self.animateSet forState:state];
}

- (void)setTapButtonHandler:(void (^)(UIButton *))tapButtonHandler forState:(MTEmptySetterState)state {
    [self setObject:tapButtonHandler inDictionary:self.tapButtonHandlers forState:state];
}

- (void)setTapViewHandler:(void (^)(UIView *))tapViewHandler forState:(MTEmptySetterState)state {
    [self setObject:tapViewHandler inDictionary:self.tapViewHandlers forState:state];
}

#pragma mark - Setter
- (void)setFadeIn:(BOOL)fadeIn {
    _fadeIn = fadeIn;
    [self setFadeIn:fadeIn forState:MTEmptySetterStateAll];
}

- (void)setDisplay:(BOOL)display {
    _display = display;
    [self setDisplay:display forState:MTEmptySetterStateAll];
}

- (void)setForcedToDisplay:(BOOL)forcedToDisplay {
    _forcedToDisplay = forcedToDisplay;
    [self setForcedToDisplay:forcedToDisplay forState:MTEmptySetterStateAll];
}

- (void)setTouchable:(BOOL)touchable {
    _touchable = touchable;
    [self setTouchable:touchable forState:MTEmptySetterStateAll];
}

- (void)setScrollable:(BOOL)scrollable {
    _scrollable = scrollable;
    [self setScrollable:scrollable forState:MTEmptySetterStateAll];
}

- (void)setAnimate:(BOOL)animate {
    _animate = animate;
    [self setAnimate:animate forState:MTEmptySetterStateAll];
}

- (void)setTapButtonHandler:(void (^)(UIButton *))tapButtonHandler {
    _tapButtonHandler = tapButtonHandler;
    [self setTapButtonHandler:tapButtonHandler forState:MTEmptySetterStateAll];
}

- (void)setTapViewHandler:(void (^)(UIView *))tapViewHandler {
    _tapViewHandler = tapViewHandler;
    [self setTapViewHandler:tapViewHandler forState:MTEmptySetterStateAll];
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    [self setObject:titleFont inDictionary:self.titleFonts forState:MTEmptySetterStateAll];
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    [self setObject:titleColor inDictionary:self.titleColors forState:MTEmptySetterStateAll];
}

- (void)setDescriptionFont:(UIFont *)descriptionFont {
    _descriptionFont = descriptionFont;
    [self setObject:descriptionFont inDictionary:self.descriptionFonts forState:MTEmptySetterStateAll];
}

- (void)setDescriptionColor:(UIColor *)descriptionColor {
    _descriptionColor = descriptionColor;
    [self setObject:descriptionColor inDictionary:self.descriptionColors forState:MTEmptySetterStateAll];
}

- (void)setButtonTitleFont:(UIFont *)buttonTitleFont {
    _buttonTitleFont = buttonTitleFont;
    [self setObject:buttonTitleFont inDictionary:self.buttonTitleFonts forState:MTEmptySetterStateAll];
}

- (void)setButtonTitleColor:(UIColor *)buttonTitleColor {
    _buttonTitleColor = buttonTitleColor;
    [self setObject:buttonTitleColor inDictionary:self.buttonTitleColors forState:MTEmptySetterStateAll];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    [self setObject:backgroundColor inDictionary:self.backgroundColors forState:MTEmptySetterStateAll];
}

- (void)setVerticalOffset:(CGFloat)verticalOffset {
    _verticalOffset = verticalOffset;
    [self setObject:@(verticalOffset) inDictionary:self.verticalOffsets forState:MTEmptySetterStateAll];
}

- (void)setSpaceHeight:(CGFloat)spaceHeight {
    _spaceHeight = spaceHeight;
    [self setObject:@(spaceHeight) inDictionary:self.spaceHeights forState:MTEmptySetterStateAll];
}

#pragma mark - DZNEmptyDataSetSource
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    return [self availableObjectInDictionary:self.titles];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    return [self availableObjectInDictionary:self.descriptions];
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [self availableObjectInDictionary:self.images];
}

- (UIColor *)imageTintColorForEmptyDataSet:(UIScrollView *)scrollView {
    return [self availableObjectInDictionary:self.imageTintColors];
}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView {
    return [self availableObjectInDictionary:self.imageAnimations];
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    NSDictionary *dict = [self availableObjectInDictionary:self.buttonTitles];
    return dict ? dict[@(state)] : nil;
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    NSDictionary *dict = [self availableObjectInDictionary:self.buttonImages];
    return dict ? dict[@(state)] : nil;
}

- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    NSDictionary *dict = [self availableObjectInDictionary:self.buttonBackgroundImages];
    return dict ? dict[@(state)] : nil;
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return [self availableObjectInDictionary:self.backgroundColors];
}

- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    return [self availableObjectInDictionary:self.customViews];
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    NSNumber *value = [self availableObjectInDictionary:self.verticalOffsets];
    return value ? [value floatValue] : 0;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    NSNumber *value = [self availableObjectInDictionary:self.spaceHeights];
    return value ? [value floatValue] : 0;
}

#pragma mark - DZNEmptyDataSetDelegate
- (BOOL)emptyDataSetShouldFadeIn:(UIScrollView *)scrollView {
    return [[self availableObjectInDictionary:self.fadeInSet] boolValue];
}

- (BOOL)emptyDataSetShouldBeForcedToDisplay:(UIScrollView *)scrollView {
    return [[self availableObjectInDictionary:self.forcedToDisplaySet] boolValue];
}

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    return [[self availableObjectInDictionary:self.displaySet] boolValue];
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView {
    return [[self availableObjectInDictionary:self.touchableSet] boolValue];
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return [[self availableObjectInDictionary:self.scrollableSet] boolValue];
}

- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView {
    return [[self availableObjectInDictionary:self.animateSet] boolValue];
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view {
    void (^handler)(UIView *view) = [self availableObjectInDictionary:self.tapViewHandlers];
    if (handler) {
        handler(view);
    }
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    void (^handler)(UIView *view) = [self availableObjectInDictionary:self.tapButtonHandlers];
    if (handler) {
        handler(button);
    }
}

#pragma mark - Private
- (void)setObject:(id)object inDictionary:(NSMutableDictionary *)dictionary forState:(MTEmptySetterState)state {
    if (state & MTEmptySetterState_None) {
        dictionary[@(MTEmptySetterState_None)] = object;
    }
    if (state & MTEmptySetterState_Loading) {
        dictionary[@(MTEmptySetterState_Loading)] = object;
    }
    if (state & MTEmptySetterState_Empty) {
        dictionary[@(MTEmptySetterState_Empty)] = object;
    }
    if (state & MTEmptySetterState_Failed) {
        dictionary[@(MTEmptySetterState_Failed)] = object;
    }
}

- (void)setObject:(id)object forControlState:(UIControlState)cState inDictionary:(NSMutableDictionary *)dictionary forState:(MTEmptySetterState)state {
    if (state & MTEmptySetterState_None) {
        NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
        NSDictionary *oldDict = [self availableObjectInDictionary:dictionary forState:MTEmptySetterState_None];
        if (oldDict) {
            [newDict addEntriesFromDictionary:oldDict];
        }
        newDict[@(cState)] = object;
        dictionary[@(MTEmptySetterState_None)] = newDict;
    }
    if (state & MTEmptySetterState_Loading) {
        NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
        NSDictionary *oldDict = [self availableObjectInDictionary:dictionary forState:MTEmptySetterState_Loading];
        if (oldDict) {
            [newDict addEntriesFromDictionary:oldDict];
        }
        newDict[@(cState)] = object;
        dictionary[@(MTEmptySetterState_Loading)] = newDict;
    }
    if (state & MTEmptySetterState_Empty) {
        NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
        NSDictionary *oldDict = [self availableObjectInDictionary:dictionary forState:MTEmptySetterState_Empty];
        if (oldDict) {
            [newDict addEntriesFromDictionary:oldDict];
        }
        newDict[@(cState)] = object;
        dictionary[@(MTEmptySetterState_Empty)] = newDict;
    }
    if (state & MTEmptySetterState_Failed) {
        NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
        NSDictionary *oldDict = [self availableObjectInDictionary:dictionary forState:MTEmptySetterState_Failed];
        if (oldDict) {
            [newDict addEntriesFromDictionary:oldDict];
        }
        newDict[@(cState)] = object;
        dictionary[@(MTEmptySetterState_Failed)] = newDict;
    }
}

- (id)availableObjectInDictionary:(NSDictionary *)dictionary forState:(MTEmptySetterState)state {
    for (NSNumber *key in [dictionary allKeys]) {
        NSUInteger option = [key unsignedIntegerValue];
        if (option & state) {
            return dictionary[key];
        }
    }
    return nil;
}

- (id)availableObjectInDictionary:(NSDictionary *)dictionary {
    return [self availableObjectInDictionary:dictionary forState:self.state];
}

- (NSAttributedString *)attributedStringWithString:(NSString *)string useFonts:(NSDictionary *)fonts andColors:(NSDictionary *)colors forState:(MTEmptySetterState)state {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    UIFont *font = [self availableObjectInDictionary:fonts forState:state];
    UIColor *color = [self availableObjectInDictionary:colors forState:state];
    if (font) {
        [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attributedString.length)];
    }
    if (color) {
        [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, attributedString.length)];
    }
    
    return attributedString;
}

@end
