//
//  YINRoute.m
//  BL_BaseApp
//
//  Created by apple on 2018/10/26.
//  Copyright © 2018 王印. All rights reserved.
//

#import <objc/runtime.h>
#import "YINRouteManager.h"
#import "YINRouteURLData.h"
#import "YINRouteCurrentController.h"
#import "YINRouteURLPathRegist.h"
#import "YINRouteConfig.h"

#define LogError(str) [NSString stringWithFormat:@"YINRouteError: %@",str]

@interface YINRouteManager ()
@property (copy,nonatomic) void(^ routeActionBlock)(NSString *actionName,NSDictionary *data);
@end

@implementation YINRouteManager

UIViewController * _Nonnull y_currentController(){
    return [YINRouteCurrentController getCurrent];
}

UIViewController * _Nonnull y_controller(NSString *name){
    if (!name||name.length==0) {
        LogError(@"请传入class名");
        return nil;
    }
    if ([[YINRouteURLPathRegist shareInstance].registDict objectForKey:name]) {
        name = [[YINRouteURLPathRegist shareInstance].registDict objectForKey:name];
    }
    id vc = [[NSClassFromString(name) alloc] init];
    if (vc) {
        if ([vc isKindOfClass:[UIViewController class]]) {
            return vc;
        }
        NSString *error = [NSString stringWithFormat:@"Class %@不是controller",name];
        LogError(error);
        return nil;
    }else{
        NSString *error = [NSString stringWithFormat:@"Class %@不存在",name];
        LogError(error);
        return nil;
    }
}

+ (void)startWithUrlSchemes:(NSArray <NSString *>*)allows pageHost:(NSString *)pageMark actionHost:(NSString *)actionMark actionBlock:(void (^)(NSString *actionName,NSDictionary *data))block;{
    [[YINRouteConfig shareInstance] setOpenPageHost:pageMark];
    [YINRouteConfig shareInstance].urlSchemes = allows;
 
    [[YINRouteConfig shareInstance] setActionHost:actionMark];
    [YINRouteManager shareInstance].routeActionBlock = block;
}

+ (instancetype)shareInstance;{
    static YINRouteManager *route = nil;
    if (!route) {
        route = [[YINRouteManager alloc] init];
    }
    return route;
}

//处理app间的通信、跳转等事件 
- (BOOL)appActionWithUrl:(NSURL *)url{
    if (![[[YINRouteConfig shareInstance]urlSchemes] containsObject:url.scheme]) {
        return NO;
    }
    YINRouteURLData *data = [YINRouteURLData urlDataWithUrl:url];
    if (data.routeType==YINAppRouteTypePage) {
        //页面跳转类型
        return [self pushVcName:data.controllerName from:nil withData:data.data];
    }else{
        //方法执行
        NSString *actionName = data.actionName;
        NSDictionary *actionData = data.data;
        if (self.routeActionBlock) {
            self.routeActionBlock(actionName, actionData);
        }
    }
    return YES;
}

- (BOOL)push:(UIViewController *)vc from:(UIViewController *)fromvc  withData:(NSDictionary *)data;{
    UIViewController *a = fromvc?fromvc:y_currentController();
    if (!vc) {
        return NO;
    }
    [data enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        @try {
            [vc setValue:obj forKey:key];
        } @catch (NSException *exception) {
        } @finally {
        }
    }];
    vc.hidesBottomBarWhenPushed = YES;
    [a.navigationController pushViewController:vc animated:YES];
    return YES;
}

- (BOOL)present:(UIViewController *)vc from:(UIViewController *)fromvc  withData:(NSDictionary *)data;{
    UIViewController *a = fromvc?fromvc:y_currentController();
    if (!vc) {
        return NO;
    }
    [data enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        @try {
            [vc setValue:obj forKey:key];
        } @catch (NSException *exception) {
        } @finally {
        }
    }];
    [a presentViewController:vc animated:YES completion:^{
    }];
    return YES;
}

//调用某个页面
- (BOOL)pushVcName:(NSString *)vcName from:(UIViewController *)fromvc withData:(NSDictionary *)data{
    UIViewController *vc = y_controller(vcName);
    return [self push:vc from:fromvc withData:data];
}

- (BOOL)presentVcName:(NSString *)vcName from:(UIViewController *)fromvc withData:(NSDictionary *)data{
    UIViewController *vc = y_controller(vcName);
    return [self present:vc from:fromvc withData:data];
}



@end
