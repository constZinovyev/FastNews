//
//  FNSNewsListInteractor.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSNewsListInteractor.h"

@interface FNSNewsListInteractor ()

@property (strong, nonatomic) id<FNSNewsService> newsService;
@property (strong, nonatomic) id<FNSMapper> mapper;
@property (strong, nonatomic) id<FNSReachability> reachabilityInternetConnection;
@property (strong, nonatomic) id<FNSSourcesList> sourcesList;

@end

@implementation FNSNewsListInteractor

- (instancetype)initWithNewsService:(id<FNSNewsService>)newsService
                          andMapper:(id<FNSMapper>)mapper
                    andReachability:(id<FNSReachability>)reachability
                     andSourcesList:(id<FNSSourcesList>) sourcesList {
    self = [super init];
    if (self) {
        _mapper = mapper;
        _newsService = newsService;
        _reachabilityInternetConnection = reachability;
        _sourcesList = sourcesList;
    }
    return self;
}

- (void)obtainNewsListWithCompletionBlock:(NewsCompletionBlock)completionBlock {
    NSArray *sources = [self.sourcesList sourcesList];
    
    __weak typeof(self) weakSelf = self;
    if ([self.reachabilityInternetConnection connectedToInternet]) {
        [self.newsService obtainNewsListFromSources:sources WithCompletionBlock:^(NSArray *feed, NSError *error) {
            
            completionBlock([weakSelf fillAndSortNews:feed], error);
        }];
    }
    else {
        NSArray *feed = [self.newsService obtainAllNewsListLocal];
        completionBlock([weakSelf fillAndSortNews:feed], nil);
    }
}

- (NSArray*)fillAndSortNews:(NSArray*)feed {
    NSMutableArray *feedNewsObjects = [self.mapper mappingFromObject:feed];
    NSArray *sortNews = [self sortNewsByDate:feedNewsObjects];
    return sortNews;
}

- (NSArray*)sortNewsByDate:(NSMutableArray*)news{
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:NSStringFromSelector(@selector(date)) ascending:NO];
    news = [[news sortedArrayUsingDescriptors:@[sortDescriptor]] mutableCopy];
    return news;
}

@end
