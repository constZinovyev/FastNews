//
//  FNSRSSReciever.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 06.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FNSRSSFeedBlock)(NSArray *feed, NSError *error);

@protocol FNSRSSReciever <NSObject>

- (void)obtainRSSFeedFromURL:(NSURL*)url withCompletionBlock:(FNSRSSFeedBlock)block;

@end