//
//  YINRouteConfig.h
//  BL_BaseApp
//
//  Created by apple on 2018/10/27.
//  Copyright © 2018 王印. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface YINRouteConfig : NSObject
//判断通讯类型为方法执行
@property (copy,nonatomic) NSString *actionHost;
//判断通讯类型为页面跳转
@property (copy,nonatomic) NSString *openPageHost;

//url通信时对满足此条件的urlScheme进行路由控制 为什么使用数组呢 因为有可能对不同的介入app开放不同的urlscheme 一般情况只判断一种
@property (strong,nonatomic)NSArray* urlSchemes;


+ (instancetype)shareInstance;


@end

