//
//  FNSRSSReciever.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 06.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^FNSRSSFeedBlock)(NSArray *feed, NSError *error);

/**
 This protocol describes object that obtain RSS feed from URL
 */

@protocol FNSRSSReciever <NSObject>

/**
 *    Method is used to obtain News object from URL
 *
 *    @param url   Source RSS feed
 *    @param block FNSRSSFeedBlock called upon completion the method, and returns News feed item and NSError object if there is any
 */

- (void)obtainRSSFeedFromURL:(NSURL*)url withCompletionBlock:(FNSRSSFeedBlock)block;

@end