//
//  YINRoute.h
//  BL_BaseApp
//
//  Created by apple on 2018/10/26.
//  Copyright © 2018 王印. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

UIViewController  *_Nonnull y_controller(NSString *name);

@interface YINRouteManager : NSObject

+ (instancetype)shareInstance;

/**
 开启url路由访问功能

 @param allows 允许的urlschemes
 @param pageMark 代表page访问的host标示
 @param actionMark 代表方法访问的host标示
 */
+ (void)startWithUrlSchemes:(NSArray <NSString *>*)allows pageHost:(NSString *)pageMark actionHost:(NSString *)actionMark actionBlock:(void (^)(NSString *actionName,NSDictionary *data))block;


//处理app间的通信、跳转等事件 可以打开appe内所有controller
- (BOOL)appActionWithUrl:(NSURL *)url;


/**
 通过页面路由字符串push

 @param vcName 页面标示 默认为类名
 @param fromvc
 @param data 参数字典 可以放回调block
 示例:
 
 id callback = ^(NSString *pass){
    NSLog(@"%@", pass);
 };
 callback 目标页面有这个block属性即可
  @{"name":@"sdsaad",@"callBack":callback}
 @return
 */
- (BOOL)pushVcName:(NSString *)vcName from:(UIViewController *)fromvc  withData:(NSDictionary *)data;

/**
 通过页面路由字符串present
 
 @param vcName 页面标示 默认为类名
 @param fromvc
 @param data 参数字典 可以放回调block
 示例:
 
 id callback = ^(NSString *pass){
 NSLog(@"%@", pass);
 };
 callback 目标页面有这个block属性即可
 @{"name":@"sdsaad",@"callBack":callback}
 @return
 */
- (BOOL)presentVcName:(NSString *)vcName from:(UIViewController *)fromvc  withData:(NSDictionary *)data;

/**
 通过页面路由对象push
 
 @param vc 页面
 @param fromvc
 @param data 参数字典 可以放回调block
 示例:
 
 id callback = ^(NSString *pass){
 NSLog(@"%@", pass);
 };
 callback 目标页面有这个block属性即可
 @{"name":@"sdsaad",@"callBack":callback}
 @return
 */
- (BOOL)push:(UIViewController *)vc from:(UIViewController *)fromvc  withData:(NSDictionary *)data;

/**
 通过页面路由对象present
 
 @param vc 页面
 @param fromvc
 @param data 参数字典 可以放回调block
 示例:
 
 id callback = ^(NSString *pass){
 NSLog(@"%@", pass);
 };
 callback 目标页面有这个block属性即可
 @{"name":@"sdsaad",@"callBack":callback}
 @return
 */
- (BOOL)present:(UIViewController *)vc from:(UIViewController *)fromvc  withData:(NSDictionary *)data;

@end


