//
//  FNSMultipleRSSReciever.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 07.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RSSFeedBlock)(NSArray *feed, NSError *error);

@protocol FNSMultipleRSSReciever <NSObject>

- (void)obtainRSSFeedFromSources:(NSArray*)sources withCompletionBlock:(RSSFeedBlock)block;

@end