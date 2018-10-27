//
//  YINRouteConfig.m
//  BL_BaseApp
//
//  Created by apple on 2018/10/27.
//  Copyright © 2018 王印. All rights reserved.
//

#import "YINRouteConfig.h"


@implementation YINRouteConfig

+ (instancetype)shareInstance;{
    static  YINRouteConfig *config = nil;
    if (!config) {
        config = [[YINRouteConfig alloc] init];
    }
    return config;
}
- (NSString *)openPageHost{
    if (!_openPageHost) {
        _openPageHost = @"open";
    }
    return _openPageHost;
}

- (NSString *)actionHost{
    if (!_actionHost) {
        _actionHost = @"action";
    }
    return _actionHost;
}

//- (NSArray<NSString *> *)urlScheme{
//    if (!_urlScheme) {
//        _urlScheme = @[];
//    }
//    return _urlScheme;
//}
@end
