//
//  YINRouteURLPath.m
//  BL_BaseApp
//
//  Created by apple on 2018/10/26.
//  Copyright © 2018 王印. All rights reserved.
//

#import "YINRouteURLPathRegist.h"

@implementation YINRouteURLPathRegist

+ (instancetype)shareInstance;{
    static YINRouteURLPathRegist *a = nil;
    if (!a) {
        a = [[YINRouteURLPathRegist alloc] init];
    }
    return a;
}

- (NSMutableDictionary *)registDict{
    if (!_registDict) {
        _registDict = @{}.mutableCopy;
    }
    return _registDict;
}

- (void)registClass:(NSString *)className withPath:(NSString *)path;{
    if (!className||className.length==0) {
        return;
    }
    if (!path||path.length==0) {
        [self removePathRegist:className];
        return;
    }
    [self.registDict setObject:className forKey:path];
    
}
- (void)removePathRegist:(NSString *)className;{
    if (!className||className.length==0) {
        return;
    }
    
   __block NSString *removeKey = nil;
    [self.registDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:className]) {
            removeKey = key;
            *stop = YES;
        }
    }];
    if (removeKey) {
        [self.registDict removeObjectForKey:removeKey];
    }
}
@end
