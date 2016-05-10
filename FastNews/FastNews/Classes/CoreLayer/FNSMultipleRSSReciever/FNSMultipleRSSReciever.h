//
//  FNSMultipleRSSReciever.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 07.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FNSRSSFeedBlock)(NSArray *feed, NSError *error);

/**
 This protocol describes object that obtain RSS feed from several URL
 */

@protocol FNSMultipleRSSReciever <NSObject>

/**
 *    Method is used to obtain News object from several URL
 *
 *    @param sources   Sources RSS feed
 *    @param block FNSRSSFeedBlock called upon completion the method, and returns News feed item and NSError object if there is any
 */

- (void)obtainRSSFeedFromSources:(NSArray*)sources withCompletionBlock:(FNSRSSFeedBlock)block;

@end