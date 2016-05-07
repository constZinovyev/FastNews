//
//  FNSMultipleRSSRecieverImplementation.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 07.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSMultipleRSSRecieverImplementation.h"
#import "FNSRSSReciever.h"

typedef void(^RSSFeedBlock)(NSArray *feed, NSError *error);

@interface FNSMultipleRSSRecieverImplementation ()

@property (strong, nonatomic) id <FNSRSSReciever> recieverRSS;
@property (nonatomic, strong) NSEnumerator *enumeratorSources;
@property (nonatomic, strong) NSMutableArray *feedFromSources;
@property (nonatomic, strong) NSArray *sourcesRSS;

@end

@implementation FNSMultipleRSSRecieverImplementation

- (instancetype)initWithRSSReciever:(id <FNSRSSReciever>)reciever{
    self = [super init];
    
    if (self) {
        _recieverRSS = reciever;
        _feedFromSources = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)obtainRSSFeedFromSources:(NSArray*)sources withCompletionBlock:(RSSFeedBlock)block{
    self.sourcesRSS = sources;
    self.enumeratorSources = [sources objectEnumerator];
    [self recieveRSSFromSourcesWithCompletionBlock:block];
}

- (void)recieveRSSFromSourcesWithCompletionBlock:(RSSFeedBlock)block{
    NSURL *sourceURL;
    __weak typeof(self) weakSelf = self;
    if (sourceURL = [self.enumeratorSources nextObject]){
        [self.recieverRSS obtainRSSFeedFromURL:sourceURL withCompletionBlock:^(NSArray *feed, NSError *error) {
            if (error){
                block(feed,error);
            }
            else{
                [weakSelf.feedFromSources addObjectsFromArray:feed];
                [weakSelf recieveRSSFromSourcesWithCompletionBlock:block];
            }
        }];
    }
    else {
        block(weakSelf.feedFromSources, nil);
    }
}


//- (void)obtainRSSFeedFromSources:(NSArray*)sources withCompletionBlock:(RSSFeedBlock)block{
//    block(@[@3, @1, @4, @2, @3, @1, @4, @2], nil);
//}

@end
