//
//  AppDelegate.h
//  iOSDemo6
//
//  Created by zhuku on 2019/7/2.
//  Copyright © 2019 zhuku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Flutter/Flutter.h>
#import <flutter_boost/FlutterBoost.h>
#import "DemoRouter.h"

@interface AppDelegate : FLBFlutterAppDelegate <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) FlutterEngine *flutterEngine;

@end

