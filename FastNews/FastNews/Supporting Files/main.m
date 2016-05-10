//
//  main.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 06.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RamblerAppDelegateProxy.h"
#import "CoreDataAppDelegate.h"
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        [[RamblerAppDelegateProxy injector] addAppDelegates:@[[CoreDataAppDelegate new]]];
        [[RamblerAppDelegateProxy injector] setDefaultAppDelegate:[AppDelegate new]];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([RamblerAppDelegateProxy class]));
    }
}
