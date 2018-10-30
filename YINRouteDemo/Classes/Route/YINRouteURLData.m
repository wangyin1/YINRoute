//
//  YINRouteURLData.m
//  BL_BaseApp
//
//  Created by apple on 2018/10/26.
//  Copyright © 2018 王印. All rights reserved.
//

#import "YINRouteURLData.h"
#import "YINRouteConfig.h"

@implementation YINRouteURLData


+ (instancetype)urlDataWithUrl:(NSURL *)url;{

    YINRouteURLData *a =  [[self alloc] init];
    a.URL = url;
    return a;
}

- (NSURL *)URL{
    if (!_URL) {
        _URL = [NSURL URLWithString:@"app://"];
    }
    return _URL;
}

- (NSString *)controllerName{
   
    if (self.routeType == YINAppRouteTypePage) {
        NSString *path =self.URL.path.length>0?[self.URL.path substringFromIndex:1]:@"";
      
        return path;
    }
    return nil;
}

- (YINAppRouteType)routeType{
    if (self.URL.host&&[self.URL.host isEqualToString:[YINRouteConfig shareInstance].actionHost]) {
        return YINAppRouteTypeAction;
    }
    return YINAppRouteTypePage;
}

- (NSString *)actionName{
    if (self.routeType == YINAppRouteTypeAction) {
        return self.URL.path.length>0?[self.URL.path substringFromIndex:1]:@"";
    }
    return nil;
}

- (NSDictionary *)data{
    NSString *dataStr = [NSString stringWithFormat:@"%@",self.URL.query];
    NSArray *keyValues = [dataStr componentsSeparatedByString:@"&"];
    NSMutableDictionary *dic = @{}.mutableCopy;
    [keyValues enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [dic setObject:[obj componentsSeparatedByString:@"="].lastObject forKey:[obj componentsSeparatedByString:@"="].firstObject];
    }];
    return dic;
}

@end
