//
//  RechargeViewController.m
//  Psf
//
//  Created by 燕来秋mac9 on 2018/7/3.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "RechargeViewController.h"
#import "RechargeHeadView.h"
#import "BottomView.h"
#import "PayTypeView.h"
@interface RechargeViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *bgscrollow;
@property(nonatomic,strong)RechargeHeadView *headView;
@property(nonatomic,strong)BottomView *bottomView;
@property(nonatomic,strong)PayTypeView *payView;
@end

@implementation RechargeViewController
-(UIScrollView *)bgscrollow{
    if (!_bgscrollow) {
        _bgscrollow = [[UIScrollView alloc]initWithFrame:CGRectMake(0, [self navHeightWithHeight], SCREENWIDTH, SCREENHEIGHT)];
        _bgscrollow.delegate = self;
    }
    return _bgscrollow;
}
-(BottomView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[BottomView alloc]init];
        _bottomView.frame = CGRectMake(0, SCREENHEIGHT-53, SCREENWIDTH, 53);
        [_bottomView.bottomBtn setTitle:@"充值" forState:UIControlStateNormal];
        _bottomView.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _bottomView;
}
-(RechargeHeadView *)headView{
    if (!_headView) {
        _headView = [[RechargeHeadView alloc]init];
    }
    return _headView;
}
-(PayTypeView *)payView{
    if (!_payView) {
        _payView = [[PayTypeView alloc]init];
    }
    return _payView;
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setNavWithTitle:@"充值余额"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.bgscrollow];
    [self.bgscrollow addSubview:self.headView];
    [self.bgscrollow addSubview:self.payView];
    [self.view addSubview:self.bottomView];
    NSMutableArray *dataArr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    [self.headView setDataArr:dataArr];
    self.headView.frame = CGRectMake(0, 0, SCREENWIDTH, (dataArr.count+1)/2*105+25);
    self.payView.frame = CGRectMake(0, self.headView.ctBottom+10, SCREENWIDTH, 45);
    [self.headView setChooseBlock:^(NSInteger index) {
        
    }];
    [self.payView setChooseBlock:^(NSInteger index) {
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
