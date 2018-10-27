//
//  ViewController.m
//  YINRouteDemo
//
//  Created by apple on 2018/10/27.
//  Copyright © 2018 王印. All rights reserved.
//

#import "ViewController.h"
#import "YINRoute.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)openPage:(UIButton *)sender {
    id block = ^(NSString *str){
        NSLog(@"%@",str);
    };
    [self y_pushVcName:@"DetailViewController" withData:@{
                                                          @"name":@"wangyin",
                                                          @"callBack":block
                                                          }];
}
- (IBAction)urlOpenPage:(UIButton *)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"YINRouteDemo://open/detail?name=wangyin1"] options:@{} completionHandler:^(BOOL success) {
        
    }];
}

- (IBAction)urlaction:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"YINRouteDemo://action/logPrint?name=wangyin2"] options:@{} completionHandler:^(BOOL success) {
        
    }];
}

@end
