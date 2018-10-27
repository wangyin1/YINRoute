//
//  YINRouteCurrentController.m
//  BL_BaseApp
//
//  Created by apple on 2018/10/26.
//  Copyright © 2018 王印. All rights reserved.
//

#import "YINRouteCurrentController.h"

@implementation YINRouteCurrentController

+ (UIViewController *)getCurrent{
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        if (window.windowLevel != UIWindowLevelNormal) {
            NSArray *windows = [[UIApplication sharedApplication] windows];
            for (UIWindow *w in windows) {
                if (w.windowLevel==UIWindowLevelNormal) {
                    window = w;
                    break;
                }
            }
        }
   UIViewController * result = window.rootViewController;
    while (result.presentedViewController) {
        result = result.presentedViewController;
    }
    if ([result isKindOfClass:[UITabBarController class]]) {
        result = [(UITabBarController *)result selectedViewController];
    }
    
    if ([result isKindOfClass:[UINavigationController class]]) {
        result = [(UINavigationController *)result visibleViewController];
    }
    return result;
}

@end
