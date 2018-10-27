//
//  DetailViewController.h
//  YINRouteDemo
//
//  Created by apple on 2018/10/27.
//  Copyright © 2018 王印. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface DetailViewController : UIViewController

@property (copy,nonatomic) NSString *name;

@property (nonatomic, copy)void (^callBack)(NSString *str);

@end


