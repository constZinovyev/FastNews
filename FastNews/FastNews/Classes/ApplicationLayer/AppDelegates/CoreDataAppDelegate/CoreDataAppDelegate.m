//
//  CoreDataAppDelegate.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "CoreDataAppDelegate.h"
#import <MagicalRecord/MagicalRecord.h>

static NSString * const kRSSCoreDataStoreName = @"RSSReader";

@implementation CoreDataAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [MagicalRecord setupCoreDataStackWithStoreNamed:kRSSCoreDataStoreName];
    
    return YES;
}

@end
