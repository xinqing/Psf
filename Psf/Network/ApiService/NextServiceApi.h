//
//  NextServiceApi.h
//  Psf
//
//  Created by 燕来秋mac9 on 2018/6/21.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "BaseApi.h"
#import "StairCategoryReq.h"
#import "ZSConfig.h"
#import "StairCategoryRes.h"
#import "GoodDetailRes.h"
@interface NextServiceApi : BaseApi
+ (instancetype)share;
///商品分类列表,包含一二级分类
- (void)requestApplyLoadWithParam:(StairCategoryReq *) req response:(responseModel) responseModel;
///获取分类下商品信息
- (void)requestSortListLoadWithParam:(StairCategoryReq *) req response:(responseModel) responseModel;
///商品详情页
- (void)requestGoodDetailLoadWithParam:(StairCategoryReq *) req response:(responseModel) responseModel;
///获取推荐商品列表
- (void)requestRecommendListLoadWithParam:(StairCategoryReq *) req response:(responseModel) responseModel;
///获取爆款商品列表
- (void)requestHotListLoadWithParam:(StairCategoryReq *) req response:(responseModel) responseModel;
///获取优惠券列表
- (void)requestCouponListLoadWithParam:(StairCategoryReq *) req response:(responseModel) responseModel;
///获取评价列表
- (void)requestEvaluateListModelListLoadWithParam:(StairCategoryReq *) req response:(responseModel) responseModel;
@end
