//
//  YINRouteURLData.h
//  BL_BaseApp
//
//  Created by apple on 2018/10/26.
//  Copyright © 2018 王印. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, YINAppRouteType) {
    YINAppRouteTypePage = 0, // 打开页面
    YINAppRouteTypeAction = 1, // 调用方法
};

//建议在host位传入通讯类型 page或action path位如果是page类型就传入页面标识 action类型就传入方法标识
//页面标识默认为controller类名 如果设置了appOpenPath属性则以appOpenPath为准
//NSURL *url = [NSURL URLWithString:@"urlscheme://host/path?page=100"];

@interface YINRouteURLData : NSObject

/**
 路由类型   YINAppRouteTypePage = 0, // 打开页面
 YINAppRouteTypeAction = 1, // 调用方法
 */
@property (assign,nonatomic,readonly) YINAppRouteType   routeType;


/**
 页面名
 */
@property (copy,nonatomic,readonly) NSString   *controllerName;


/**
 方法名
 */
@property (copy,nonatomic,readonly) NSString   *actionName;


/**
 传递参数
 */
@property (strong,nonatomic,readonly) NSDictionary   *data;


/**
 原始URL
 */
@property (strong,nonatomic) NSURL     *URL;


/**
 便利构造

 @param url 
 @return
 */
+ (instancetype)urlDataWithUrl:(NSURL *)url;

@end


