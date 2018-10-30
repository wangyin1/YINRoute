//
//  YINRouteURLPath.h
//  BL_BaseApp
//
//  Created by apple on 2018/10/26.
//  Copyright © 2018 王印. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface YINRouteURLPathRegist : NSObject


/**
 特殊路由标示注册字典
 */
@property (strong,nonatomic) NSMutableDictionary *registDict;

+ (instancetype)shareInstance;

/**
 注册

 @param className 页面类名
 @param path 标示
 */
- (void)registClass:(NSString *)className withPath:(NSString *)path;


/**
 移除

 @param className 
 */
- (void)removePathRegist:(NSString *)className;

@end


