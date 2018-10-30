//
//  UIViewController+YINRoute.m
//  BL_BaseApp
//
//  Created by apple on 2018/10/26.
//  Copyright © 2018 王印. All rights reserved.
//

#import "UIViewController+YINRoute.h"
#import "YINRouteURLPathRegist.h"
@implementation UIViewController (YINRoute)

+ (void)y_registPath:(NSString *)appOpenPath{
    if (!appOpenPath||appOpenPath.length<1) {
        
        [[YINRouteURLPathRegist shareInstance] removePathRegist:NSStringFromClass(self.class)];
        
    }else{
        [[YINRouteURLPathRegist shareInstance] registClass:NSStringFromClass(self.class) withPath:appOpenPath];
      
    }
}

- (BOOL)y_push:(UIViewController *)vc;{
  return [self y_push:vc withData:nil];
}

- (BOOL)y_present:(UIViewController *)vc;{
    return [self y_present:vc withData:nil];
}

- (BOOL)y_push:(UIViewController *)vc withData:(NSDictionary *)data;{
    return [[YINRouteManager shareInstance] push:vc from:self withData:data];
}

- (BOOL)y_present:(UIViewController *)vc withData:(NSDictionary *)data;{
      return [[YINRouteManager shareInstance] present:vc from:self withData:data];
}

- (BOOL)y_pushVcName:(NSString *)vcName;{
    return [self y_pushVcName:vcName withData:nil];
}

- (BOOL)y_presentVcName:(NSString *)vcName;{
    return [self y_presentVcName:vcName withData:nil];
}

- (BOOL)y_pushVcName:(NSString *)vcName withData:(NSDictionary *)data;{
    return [[YINRouteManager shareInstance] pushVcName:vcName from:self withData:data];
}

- (BOOL)y_presentVcName:(NSString *)vcName withData:(NSDictionary *)data;{
    return [[YINRouteManager shareInstance] presentVcName:vcName from:self withData:data];
}



@end
