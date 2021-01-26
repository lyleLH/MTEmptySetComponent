//
//  MTViewController.m
//  MTEmptySetComponent
//
//  Created by v2top1@163.com on 01/26/2021.
//  Copyright (c) 2021 v2top1@163.com. All rights reserved.
//

#import "MTViewController.h"
#import <Masonry/Masonry.h>
#import "UIButton+Events.h"
#import <MJRefresh/MJRefresh.h>
#import <MTEmptySetComponent/MTEmptySetComponentHeader.h>
@interface MTViewController () <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *stateButtons;
@property (strong, nonatomic)  NSArray *actions;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)  NSMutableArray *dataSource;

@end

@implementation MTViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
    
    [self makeConstraint];
    //    [self.tableView reloadData];
    
    
}


//下拉刷新
- (void)pullToRefresh {
    self.tableView.mt_emptySetter.state = MTEmptySetterState_Loading;
    [self.tableView.mj_header endRefreshing];
    [self.tableView reloadData];
}

//上拉加载
- (void)pullToLoading {
    [self.tableView.mj_footer endRefreshing];
}


- (NSArray *)actions {
    
    
    SYTButtonActionBlock block1 = ^(){
        [self.dataSource removeAllObjects];
        [self.tableView reloadData];
        self.tableView.mj_footer.hidden = YES;
        self.tableView.mt_emptySetter.state = MTEmptySetterState_Loading;
    };
    
    SYTButtonActionBlock block2 = ^(){
        
        self.tableView.mt_emptySetter.state = MTEmptySetterState_Loading;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.tableView.mt_emptySetter.state = MTEmptySetterState_None;
            self.dataSource = [[NSMutableArray alloc] initWithArray:@[@"有",@"数",@"据",@"显",@"示"]];
            [self.tableView reloadData];
        });
          
    };
    
    SYTButtonActionBlock block3 = ^(){
        [self.dataSource removeAllObjects];
        [self.tableView reloadData];
        self.tableView.mt_emptySetter.state = MTEmptySetterState_Empty;
        self.tableView.mt_emptySetter.state = MTEmptySetterState_Loading;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.tableView.mt_emptySetter.state = MTEmptySetterState_Empty;
        });
    };
    
    SYTButtonActionBlock block4 = ^(){
        [self.dataSource removeAllObjects];
        [self.tableView reloadData];
        self.tableView.mt_emptySetter.state = MTEmptySetterState_Loading;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.tableView.mt_emptySetter.state = MTEmptySetterState_Failed;
        });
        
        
    };
    _actions = @[block1,block2,block3,block4];
    return _actions;
}




- (void)makeConstraint {
    [self.stateButtons mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:70 leadSpacing:15 tailSpacing:15];
    for (NSInteger i=0; i<self.stateButtons.count; i ++) {
        UIButton * btn = self.stateButtons[i] ;
        [btn syt_handleControlEvent:UIControlEventTouchUpInside withBlock:self.actions[i]];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@10);
            make.height.equalTo(@40);
        }];
    }
}


- (void)setupEmpty {
    //设置空白状态配置
    MTGeneralEmptySetter *emptySetter = [[MTGeneralEmptySetter alloc] init];
    
    [emptySetter setBackgroundColor:[UIColor clearColor] forState:MTEmptySetterState_Loading | MTEmptySetterState_Empty | MTEmptySetterState_Failed];
    emptySetter.titleFont = [UIFont systemFontOfSize:16];
    emptySetter.titleColor = [UIColor grayColor];
    emptySetter.descriptionFont = [UIFont systemFontOfSize:14];
    emptySetter.descriptionColor = [UIColor lightGrayColor];
    emptySetter.buttonTitleFont = [UIFont systemFontOfSize:15];
    emptySetter.buttonTitleColor = [UIColor whiteColor];
    
    //加载状态配置
    [emptySetter setTitle:@"加载中..." forState:MTEmptySetterState_Loading];
    [emptySetter setImage:[UIImage imageNamed:@"loading"] forState:MTEmptySetterState_Loading];
    [emptySetter setImageAnimation:({
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"transform"];
        animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0)];
        animation.duration = 0.35;
        animation.cumulative = YES;
        animation.repeatCount = MAXFLOAT;
        animation;
        
    }) forState:MTEmptySetterState_Loading];
    [emptySetter setAnimate:YES forState:MTEmptySetterState_Loading];
    
    //无数据状态配置
    [emptySetter setTitle:@"数据为空" forState:MTEmptySetterState_Empty];
    [emptySetter setDescription:@"糟糕！这里什么都没有~" forState:MTEmptySetterState_Empty];
    [emptySetter setImage:[UIImage imageNamed:@"empty"] forState:MTEmptySetterState_Empty];
    
    //加载错误状态配置
    [emptySetter setImage:[UIImage imageNamed:@"error"] forState:MTEmptySetterState_Failed];
    [emptySetter setAttributedDescription:({
        //设置指定文字样式
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"我们的东西不见了！"];
        [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, string.length)];
        [string addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, string.length)];
        
        string;
    }) forState:MTEmptySetterState_Failed];
    
    [emptySetter setButtonTitle:@"重新载入" controlState:UIControlStateNormal forState:MTEmptySetterState_Failed];
    
    UIEdgeInsets capInsets = UIEdgeInsetsMake(25.0, 25.0, 25.0, 25.0);
    UIEdgeInsets rectInsets = UIEdgeInsetsZero;
    UIImage *bgImage = [UIImage imageNamed:@"button_background"];
    bgImage = [[bgImage resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch] imageWithAlignmentRectInsets:rectInsets];
    
    [emptySetter setButtonBackgroundImage:bgImage controlState:UIControlStateNormal forState:MTEmptySetterState_Failed];
    [emptySetter setButtonBackgroundImage:bgImage controlState:UIControlStateHighlighted forState:MTEmptySetterState_Failed];
    
    [emptySetter setSpaceHeight:20 forState:MTEmptySetterState_Failed];
    
    
    //点击按钮回调
    
    [emptySetter setTapButtonHandler:^(UIButton *button) {
        self.tableView.mt_emptySetter.state = MTEmptySetterState_Loading;
        SYTButtonActionBlock block  =  self.actions[1];
        block();
    } forState:MTEmptySetterState_Failed];
    //禁止滚动
    emptySetter.scrollable = NO;
    CGFloat offset = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    offset += CGRectGetHeight(self.navigationController.navigationBar.frame);
    emptySetter.verticalOffset = -offset;
    //emptySetter.verticalOffset = -roundf(self.tableView.frame.size.height/5);
    
    self.tableView.mt_emptySetter = emptySetter;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"----------  %@  ----------",self.dataSource[indexPath.row]];
    cell.textLabel.textAlignment = 1;
    return cell;
}



- (NSMutableArray *)dataSource {
    if(!_dataSource){
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}


- (void)setTableView:(UITableView *)tableView {
    
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.tableFooterView = [UIView new];
    tableView.estimatedRowHeight = 44;
    tableView.rowHeight = UITableViewAutomaticDimension;
    //设置tableView的header和footer
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self pullToRefresh];
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self pullToLoading];
    }];
    
    tableView.mj_header = header;
    tableView.mj_footer = footer;
    //首次进入先隐藏footer
    tableView.mj_footer.hidden = YES;
    
    _tableView = tableView;
    [self setupEmpty];
}


- (void)setStateButtons:(NSArray *)stateButtons {
    
    for (UIButton* button in stateButtons) {
        button.layer.cornerRadius = 8;
        button.layer.masksToBounds = YES;
        
        
    }
    _stateButtons = stateButtons;
}
@end
