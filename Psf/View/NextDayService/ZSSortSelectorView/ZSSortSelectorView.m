//
//  ZSSortSelectorView.m
//  ZSSortSelectorView
//
//  Created by 燕来秋mac9 on 2018/6/15.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "ZSSortSelectorView.h"
#import "ZSScrollButton.h"

@interface ZSSortSelectorView ()<ZSSortSelectorViewDelegate>
{
    CGFloat _width;
    CGFloat _height;
}
@property (nonatomic , strong) UIScrollView *mainView;

@property (nonatomic , strong) UIButton *leftBtn;

@property (nonatomic , strong) UIButton *rightBtn;

@property (nonatomic , assign) NSInteger currentPage;

@property (nonatomic , strong) NSMutableArray *buttonArr;



@end
@implementation ZSSortSelectorView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _width = frame.size.width;
        _height = frame.size.height;
        self.backgroundColor =[UIColor whiteColor];
        _buttonArr = [NSMutableArray array];
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.mainView];
//    [self addSubview:self.leftBtn];
    [self addSubview:self.rightBtn];
    
}

- (void)setDataArr:(NSArray *)dataArr {
    _dataArr =dataArr;
    [_buttonArr removeAllObjects];
    _mainView.contentSize = CGSizeMake(_dataArr.count*(_width-80)/3, _height);
    for (int i=0; i<_dataArr.count; i++) {
        ZSScrollButton *btn = [[ZSScrollButton alloc]initWithFrame:CGRectMake(i*(_width-80)/3, 0, (_width-80)/3, _height) miantitle:_dataArr[i] count:[NSString stringWithFormat:@"33"]];
        btn.tag = i+33;
        if (!i) {
            [btn changeStatus:YES];
        }
        btn.delegate = self;
        [_buttonArr addObject:btn];
        [_mainView addSubview:btn];
    }
}

#pragma mark lazy_load
- (UIScrollView *)mainView {
    if (!_mainView) {
        _mainView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, _width-40, _height)];
        _mainView.showsVerticalScrollIndicator = NO;
        _mainView.showsHorizontalScrollIndicator = NO;
        _mainView.scrollEnabled = YES;
        _mainView.bounces = YES;
        
    }
    return _mainView;
}

- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, _height)];
        _leftBtn.backgroundColor = [UIColor lightGrayColor];
        [_leftBtn addTarget:self action:@selector(decrease) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(_width-40, 0, 40, _height)];
        [_rightBtn setImage:[UIImage imageNamed:@"down_icon"] forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(increase) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

#pragma mark 方法
- (void)decrease {
    if (_currentPage>0) {
        _currentPage--;
        [self updateStatus];
    }
    
}

- (void)increase {
    if (_currentPage<_dataArr.count-1) {
        _currentPage++;
        [self updateStatus];
    }
    
}

- (void)updateStatus {
    for (ZSScrollButton *btn in _buttonArr) {
        if (btn.tag == _currentPage+33) {
            [btn changeStatus:YES];
        }else{
            [btn changeStatus:NO];
        }
    }
    if ([self.delegate respondsToSelector:@selector(chooseButtonType:)]) {
        [self.delegate chooseButtonType:_currentPage];
    }
    if (_currentPage>=0&&_currentPage<_dataArr.count-2) {
        CGFloat current =_currentPage*(_width-80)/3;
        _mainView.contentOffset = CGPointMake(current, 0);
    }
    
}

#pragma mark 代理
- (void)selectedButton:(NSInteger)sender {
    for (ZSScrollButton *btn in _buttonArr) {
        if (sender == btn.tag) {
            [btn changeStatus:YES];
        }else{
            [btn changeStatus:NO];
        }
    }
    _currentPage = sender-33;
    if ([self.delegate respondsToSelector:@selector(chooseButtonType:)]) {
        [self.delegate chooseButtonType:_currentPage];
    }
    
}

@end
