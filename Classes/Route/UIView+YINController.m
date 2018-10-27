//
//  UIView+YINController.m
//  BL_BaseApp
//
//  Created by apple on 2018/10/26.
//  Copyright © 2018 王印. All rights reserved.
//

#import "UIView+YINController.h"

@implementation UIView (YINController)

-(UIViewController *)y_currentController
{
    UIViewController *result = nil;
    UIWindow *window = [self isKindOfClass:[UIWindow class]]?(UIWindow *)self: self.window;
    result = window.rootViewController;
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
