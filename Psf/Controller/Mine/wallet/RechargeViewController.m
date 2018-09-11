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
#import "MineServiceApi.h"
#import "MineViewController.h"
#import <AlipaySDK/AlipaySDK.h>


@interface RechargeViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *bgscrollow;
@property(nonatomic,strong)RechargeHeadView *headView;
@property(nonatomic,strong)BottomView *bottomView;
@property(nonatomic,strong)PayTypeView *payView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)RechargeRuleModel *rulemodel;
@property(nonatomic,assign)BOOL selected;

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
        [_bottomView.bottomBtn addTarget:self action:@selector(pressBottom) forControlEvents:UIControlEventTouchUpInside];
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
        [self setTitle:@"充值余额"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        _bgscrollow.contentInsetAdjustmentBehavior = NO;
    } else {
        self.navigationController.navigationBar.translucent = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.bgscrollow];
    [self.bgscrollow addSubview:self.headView];
    [self.bgscrollow addSubview:self.payView];
    [self.view addSubview:self.bottomView];
    __weak typeof(self)weakself = self;
    [self.headView setChooseBlock:^(NSInteger index) {
        weakself.rulemodel = weakself.dataArr[index];
    }];
    [self.payView setChooseBlock:^(BOOL index) {
        weakself.selected = index;
    }];
    _dataArr = [NSMutableArray array];
    _rulemodel = [[RechargeRuleModel alloc]init];
    _selected = YES;
    [self requestData];
    [ZSNotification addWeixinPayResultNotification:self action:@selector(weixinPay:)];
    [ZSNotification addAlipayPayResultNotification:self action:@selector(AlipayPay:)];
}

#pragma mark-支付回调通知

-(void)weixinPay:(NSNotification *)notifi{
    NSDictionary *userInfo = [notifi userInfo];
    if ([[userInfo objectForKey:@"weixinpay"] isEqualToString:@"success"]) {
        [self showInfo:@"支付成功"];
    }
    [self showInfo:[userInfo objectForKey:@"strMsg"]];
}
-(void)AlipayPay:(NSNotification *)notifi{
    NSDictionary *userInfo = [notifi userInfo];
    
    [self showInfo:[userInfo objectForKey:@"strMsg"]];
}
-(void)pressBottom{
    StairCategoryReq *req = [[StairCategoryReq alloc]init];
    req.appId = @"993335466657415169";
    req.timestamp = @"529675086";
    
    req.token = [UserCacheBean share].userInfo.token;
    req.version = @"1.0.0";
    req.platform = @"ios";
    req.cityId = @"310100";
    req.cityName = @"上海市";
    __weak typeof(self)weakself = self;
    req.memberRechargeRuleId = _rulemodel.memberRechargeRuleId;
    [[MineServiceApi share]topUpWithParam:req response:^(id response) {
        if ([response isKindOfClass:[OrderPayRes class]]) {
            OrderPayRes *model = response;
            NSString *appScheme = @"LxnScheme";
            [[AlipaySDK defaultService] payOrder:model.body fromScheme:appScheme callback:^(NSDictionary *resultDic) {
                NSLog(@"reslut = %@",resultDic);
            }];
        }else{
            [weakself showToast:response[@"message"]];
        }
    }];
}
-(void)requestData{
    StairCategoryReq *req = [[StairCategoryReq alloc]init];
    req.appId = @"993335466657415169";
    req.timestamp = @"529675086";
    
    req.token = [UserCacheBean share].userInfo.token;
    req.version = @"1.0.0";
    req.platform = @"ios";
    req.cityId = @"310100";
    req.cityName = @"上海市";
    __weak typeof(self)weakself = self;
    [[MineServiceApi share]rechargeMemberBalanceWithParam:req response:^(id response) {
        if (response) {
            [weakself.dataArr removeAllObjects];
            [weakself.dataArr addObjectsFromArray:response];
            [weakself reloadData];
        }
    }];
}
-(void)reloadData{
    self.rulemodel = [self.dataArr firstObject];
    [self.headView setDataArr:self.dataArr];
    self.headView.frame = CGRectMake(0, 0, SCREENWIDTH, (self.dataArr.count+1)/2*105+25);
    self.payView.frame = CGRectMake(0, self.headView.ctBottom+10, SCREENWIDTH, 45);
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
