# YINRoute
app模块化路由管理器，app间urlscheme访问管理器


> 调用示例
```
id call = ^(NSString *aa){
      NSLog(@"%@",aa);
  };
  [[YINRouteManager shareInstance] pushVcName:@"LoginViewController" from:self withData:@{@"callBack":call,@"name":@"test"}];  
```
设置特殊路由标示
```
@implementation LoginViewController

+ (void)load{
//设置了路由标示后 既可以通过类名访问 也可以通过标示访问
    [self y_registPath:@"login"];
}
```
controller分类方法快捷调用

```
//页面跳转
[self y_pushVcName:@"LoginViewController" withData:@{
                                                         @"name":@"12323121"
                                                         }];
                                                         
[self y_pushVcName:@"login" withData:@{
                                                         @"name":@"12323121"
                                                         }];

```
url形式访问模块 此方法同时支持app 内模块间访问 也支持app之间的访问
开启url访问功能
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [YINRouteManager startWithUrlSchemes:@[@"YINRouteDemo"] pageHost:@"open" actionHost:@"action" actionBlock:^(NSString *actionName, id data) {
        NSLog(@"执行方法%@",actionName);
        NSLog(@"参数%@",data);
    }];
    
    return YES;
}
```
访问页面
```
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"BLBaseAPP://open/LoginViewController?name=123213&pass=123"]];
```
执行方法
```
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"BLBaseAPP://action/logPrint?name=123213&pass=123"]];
```
 
