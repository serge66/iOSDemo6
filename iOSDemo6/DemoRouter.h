//
//  DemoRouter.h
//  iOSDemo6
//
//  Created by zhuku on 2019/7/3.
//  Copyright © 2019 zhuku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Flutter/Flutter.h>
#import <flutter_boost/FlutterBoost.h>
#import <flutter_boost/FLBPlatform.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoRouter : NSObject<FLBPlatform>

@property (nonatomic,strong) UINavigationController *navigationController;

+ (DemoRouter *)sharedRouter;

@end

NS_ASSUME_NONNULL_END
