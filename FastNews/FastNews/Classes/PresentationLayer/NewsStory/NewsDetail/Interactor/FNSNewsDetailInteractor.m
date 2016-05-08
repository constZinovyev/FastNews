//
//  FNSNewsDetailInteractor.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSNewsDetailInteractor.h"
#import "FNSNewsObject.h"
#import "FNSNewsService.h"
#import "FNSMapper.h"

@interface FNSNewsDetailInteractor ()

@property (nonatomic, strong) id<FNSNewsService> newsService;
@property (nonatomic, strong) id<FNSMapper> mapper;

@end

@implementation FNSNewsDetailInteractor

- (instancetype)initWithNewsService:(id<FNSNewsService>)newsService
                          andMapper:(id<FNSMapper>)mapper {
    self = [super init];
    if (self) {
        _newsService = newsService;
        _mapper = mapper;
    }
    return self;
}

- (FNSNewsObject*)obtainNewsWithNewsId:(NSString*)newsId{
    id newsManagedObject = [self.newsService obtainNewsWithNewsId:newsId];
    FNSNewsObject *newsObject = [self.mapper mappingFromObject:newsManagedObject];
    return newsObject;
}

@end
