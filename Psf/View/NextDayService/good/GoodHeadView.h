//
//  GoodHeadView.h
//  Psf
//
//  Created by 燕来秋mac9 on 2018/6/29.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "BaseView.h"

@interface GoodHeadView : BaseView
///分享按钮
@property(nonatomic,strong)UIButton *shareBtn;
///物品名
@property(nonatomic,strong)UILabel *nameLabel;
///物品详情
@property(nonatomic,strong)UILabel *contentLabel;
///物品价格
@property(nonatomic,strong)UILabel *priceLabel;
///物品重量
@property(nonatomic,strong)UILabel *weightLabel;
///已售数量
@property(nonatomic,strong)UILabel *soldLabel;
@end
