//
//  UIViewController+YINRoute.h
//  BL_BaseApp
//
//  Created by apple on 2018/10/26.
//  Copyright © 2018 王印. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YINRouteManager.h"



@interface UIViewController (YINRoute)

//NSURL *url = [NSURL URLWithString:@"urlscheme://host/path?page=100"];
//如果设置了这个属性，当app间通信的path匹配，则打开这个页面。如果没有设置，则path与类名对比
+ (void)y_registPath:(NSString *)appOpenPath;

- (BOOL)y_pushVcName:(NSString *)vcName;

- (BOOL)y_presentVcName:(NSString *)vcName;

- (BOOL)y_pushVcName:(NSString *)vcName withData:(NSDictionary *)data;

- (BOOL)y_presentVcName:(NSString *)vcName withData:(NSDictionary *)data;

- (BOOL)y_push:(UIViewController *)vc;

- (BOOL)y_present:(UIViewController *)vc;

- (BOOL)y_push:(UIViewController *)vc withData:(NSDictionary *)data;

- (BOOL)y_present:(UIViewController *)vc withData:(NSDictionary *)data;

@end


