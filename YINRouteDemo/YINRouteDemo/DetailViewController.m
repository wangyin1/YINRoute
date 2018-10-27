//
//  DetailViewController.m
//  YINRouteDemo
//
//  Created by apple on 2018/10/27.
//  Copyright © 2018 王印. All rights reserved.
//

#import "DetailViewController.h"
#import "YINRoute.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation DetailViewController

+(void)load{
    [self y_registPath:@"detail"];
}

- (IBAction)click:(id)sender {
    if (self.callBack) {
        self.callBack(@"回调方法执行");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.text = self.name;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
