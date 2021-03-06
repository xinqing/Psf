//
//  SureOrderTableViewCell.h
//  Psf
//
//  Created by 燕来秋mac9 on 2018/7/4.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "GoodDetailRes.h"
#import "OrderListRes.h"
#import "CartProductModel.h"

@interface SureOrderTableViewCell : BaseTableViewCell

@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *countLabel;
@property(nonatomic,strong)UILabel *weightLabel;
@property(nonatomic,strong)UILabel *priceLabel;
//@property(nonatomic,strong)UIButton *addBtn;
//@property(nonatomic,strong)UIButton *subBtn;
@property(nonatomic,strong)UILabel *countField;
@property(nonatomic,strong)UILabel *lineLabel;
@property(nonatomic,strong)GoodDetailRes *model;
@property(nonatomic,strong)OrderListRes *resmodel;
@property(nonatomic,strong)CartProductModel *carmodel;

@end
