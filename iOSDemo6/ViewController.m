//
//  ViewController.m
//  iOSDemo6
//
//  Created by zhuku on 2019/7/2.
//  Copyright © 2019 zhuku. All rights reserved.
//

#import <Flutter/Flutter.h>
#import "AppDelegate.h"
#import "ViewController.h"
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>
#import "DemoRouter.h"

@interface ViewController ()
@property(nonatomic,strong)NSUserDefaults *userDefaults;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view. UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(handleButtonAction)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Press me" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
    //    [self saveNSUserDefaults];
}

- (void)handleButtonAction {
    //    FlutterEngine *flutterEngine = [(AppDelegate *)[[UIApplication sharedApplication] delegate] flutterEngine];
    //    FlutterViewController *flutterViewController = [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    //    [self presentViewController:flutterViewController animated:false completion:nil];
    
    
    
    NSLog(@"-------myString-----%@",[self.userDefaults objectForKey:@"myString"]);
    
    NSLog(@"打印log: %@", @"1111111111");
    //获取当前导航
    
    UINavigationController *navi = [self getCurrentNCFrom:self];
    DemoRouter.sharedRouter.navigationController = navi;
    [DemoRouter.sharedRouter openPage:@"zhuku://ChangePwd" params:@{@"present":@(YES),@"userid":@"d78aa2f971024d2a889e25d2ba2e1c5e",@"_ticket_":@"7foNAlJJJ547UBtp61V4BxdW2qkLQx2UyzhPUx44lw34kwq6OYwoUcZAMI0hyZCHvTLncC7+CFOWGTEWA6glzw=="}
                             animated:YES completion:^(BOOL f){}];
    
    //    [DemoRouter.sharedRouter openPage:@"zhuku://ChangePwd" params:@{@"present":@(YES)} animated:YES completion:^(BOOL f){}];
    
    //这部分代码是DemoROuter中的k打开界面的代码
    //    FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
    //    [vc setName:@"zhuku://ChangePwd" params:@{@"present":@(YES)}];
    //    [self.navigationController presentViewController:vc animated:YES completion:^{}];
    
    
    //    [DemoRouter.sharedRouter openPage:@"zhuku://ChangePwd" params:@{} animated:YES completion:^(BOOL f){
    //
    //        [FlutterBoostPlugin.sharedInstance onResultForKey:@"result_id_100" resultData:@{} params:@{}];
    //
    //    }];
    
}


//递归
- (UINavigationController *)getCurrentNCFrom:(UIViewController *)vc
{
    if ([vc isKindOfClass:[UITabBarController class]]) {
        UINavigationController *nc = ((UITabBarController *)vc).selectedViewController;
        return [self getCurrentNCFrom:nc];
    }
    else if ([vc isKindOfClass:[UINavigationController class]]) {
        if (((UINavigationController *)vc).presentedViewController) {
            return [self getCurrentNCFrom:((UINavigationController *)vc).presentedViewController];
        }
        return [self getCurrentNCFrom:((UINavigationController *)vc).topViewController];
    }
    else if ([vc isKindOfClass:[UIViewController class]]) {
        if (vc.presentedViewController) {
            return [self getCurrentNCFrom:vc.presentedViewController];
        }
        else {
            return vc.navigationController;
        }
    }
    else {
        NSAssert(0, @"未获取到导航控制器");
        return nil;
    }
}

//保存数据到NSUserDefaults
-(void)saveNSUserDefaults
{
    NSString *myString = @"enuola";
    int myInteger = 100;
    float myFloat = 50.0f;
    double myDouble = 20.0;
    NSDate *myDate = [NSDate date];
    NSArray *myArray = [NSArray arrayWithObjects:@"hello", @"world", nil];
    NSDictionary *myDictionary = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"enuo", @"20", nil] forKeys:[NSArray arrayWithObjects:@"name", @"age", nil]];
    
    //将上述数据全部存储到NSUserDefaults中
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    //存储时，除NSNumber类型使用对应的类型外，其他的都是使用setObject:forKey:
    [self.userDefaults setInteger:myInteger forKey:@"myInteger"];
    [self.userDefaults setFloat:myFloat forKey:@"myFloat"];
    [self.userDefaults setDouble:myDouble forKey:@"myDouble"];
    
    [self.userDefaults setObject:myString forKey:@"myString"];
    [self.userDefaults setObject:myDate forKey:@"myDate"];
    [self.userDefaults setObject:myArray forKey:@"myArray"];
    [self.userDefaults setObject:myDictionary forKey:@"myDictionary"];
    
    //这里建议同步存储到磁盘中，但是不是必须的
    [self.userDefaults synchronize];
    
}

@end
