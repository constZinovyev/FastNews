//
//  FNSNewsDetailRouter.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSNewsListRouter.h"

#import "FNSNewsDetailPresenterInput.h"

@implementation FNSNewsListRouter

static NSString *const kDetailRSSNewsSegue = @"NewsDetailSegue";

- (instancetype)initWithTransitionHandler:(id<RamblerViperModuleTransitionHandlerProtocol>)transitionHandler {
    self = [super init];
    if (self) {
        _transitionHandler = transitionHandler;
    }
    return self;
}

- (void)openNewsDetailWithNewsId:(NSString *)NewsId{
    
    [[self.transitionHandler openModuleUsingSegue:kDetailRSSNewsSegue] thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<FNSNewsDetailPresenterInput> moduleInput) {
        [moduleInput configureCurrentModuleWithNewsObjectId:NewsId];
        return nil;
    }];
}

@end
