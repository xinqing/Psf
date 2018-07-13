//
//  CartProductModel.h
//  Psf
//
//  Created by 燕来秋mac9 on 2018/7/10.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CartProductModel : NSObject
///
@property(nonatomic,copy)NSString *appId;
///购物车编号
@property(nonatomic,copy)NSString *cartId;
///
@property(nonatomic,assign)NSInteger cartProductIsActive;
///
@property(nonatomic,copy)NSNumber *productId;
///
@property(nonatomic,copy)NSString *productImagePath;
///
@property(nonatomic,copy)NSString *productName;
///
@property(nonatomic,copy)NSString *productPrice;
///
@property(nonatomic,copy)NSNumber *productQuantity;
///
@property(nonatomic,copy)NSString *productSkuId;
///
@property(nonatomic,copy)NSString *productSkuPrice;
///
@property(nonatomic,copy)NSString *productTitle;
///
@property(nonatomic,copy)NSString *productUnit;
///
//@property(nonatomic,copy)NSString *productWeight;
///
@property(nonatomic,copy)NSString *systemCreateTime;
///
@property(nonatomic,copy)NSString *systemCreateUserId;
///
@property(nonatomic,assign)NSInteger systemStatus;
///
@property(nonatomic,assign)NSInteger systemVersion;
///
@property(nonatomic,copy)NSString *systemUpdateTime;
///
@property(nonatomic,copy)NSString *systemUpdateUserId;
///
@property(nonatomic,assign)NSInteger productIsOnSale;

@end