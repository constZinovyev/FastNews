//
//  FNSRSSRecieverImplementation.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 06.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSRSSRecieverImplementation.h"
#import "BNRSSFeed.h"

@interface FNSRSSRecieverImplementation ()

@property (nonatomic, strong) BNRSSFeedParser *feedParser;

@end

@implementation FNSRSSRecieverImplementation

- (instancetype)initWithFeedParser:(BNRSSFeedParser*)parser{
    self = [super init];
    
    if (self){
        _feedParser = parser;
    }
    
    return self;
}

- (void)obtainRSSFeedFromURL:(NSURL*)url withCompletionBlock:(FNSRSSFeedBlock)block {
    [self.feedParser parseFeedURL:url withETag:nil untilPubDate:nil success:^(NSHTTPURLResponse *response, BNRSSFeed *channel) {
        block(channel.items, nil);
    } failure:^(NSHTTPURLResponse *response, NSError *error) {
        block (nil, error);
    }];
}

@end
