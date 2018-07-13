//
//  GroupServiceApi.h
//  Psf
//
//  Created by 燕来秋mac9 on 2018/7/13.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "BaseApi.h"
#import "StairCategoryReq.h"
#import "GroupListRes.h"

@interface GroupServiceApi : BaseApi
+ (instancetype)share;
///获取团购信息表
- (void)getGroupListWithParam:(StairCategoryReq *) req response:(responseModel) responseModel;
///获取正在拼团信息列表
- (void)spellGroupListWithParam:(StairCategoryReq *) req response:(responseModel) responseModel;
///团购价格计算
- (void)getGroupPriceWithParam:(StairCategoryReq *) req response:(responseModel) responseModel;
///团购详情
- (void)getDetailGroupWithParam:(StairCategoryReq *) req response:(responseModel) responseModel;
///团购下单
- (void)saveGroupWithParam:(StairCategoryReq *) req response:(responseModel) responseModel;
@end