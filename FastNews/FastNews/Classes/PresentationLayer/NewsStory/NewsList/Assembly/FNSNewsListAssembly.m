//
//  FNSNewsListAssembly.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSNewsListAssembly.h"
#import "FNSNewsListTableViewDelegate.h"
#import "FNSNewsListTableViewDataSource.h"

@implementation FNSNewsListAssembly

- (FNSNewsListViewController*)viewControllerNewsList {
    
    return [TyphoonDefinition withClass:[FNSNewsListViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output) with:[self presenterNewsList]];
                              [definition injectProperty:@selector(delegateTableView) with:[self delegateNewsListTableView]];
                              [definition injectProperty:@selector(dataSourceTableView) with:[self dataSourceNewsListTableView]];
                          }];
}

- (FNSNewsListInteractor*)interactorNewsList {
    
    return [TyphoonDefinition withClass:[FNSNewsListInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(initWithNewsService:andMapper:andReachability:andSourcesList:) parameters:^(TyphoonMethod *initializer) {
                                  
                                  [initializer injectParameterWith:[self.services newsService]];
                                  [initializer injectParameterWith:[self.coreLayer mapperArrayNewsManagedObjects]];
                                  [initializer injectParameterWith:[self.coreLayer reachabilityInternetConnection]];
                                  [initializer injectParameterWith:[self.coreLayer sourcesList]];
                                  
                              }];
                          }];
}

- (FNSNewsListPresenter*)presenterNewsList {
    
    return [TyphoonDefinition withClass:[FNSNewsListPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(initWithView:andInteractor:andRouter:) parameters:^(TyphoonMethod *initializer) {
                                  
                                  [initializer injectParameterWith:[self viewControllerNewsList]];
                                  [initializer injectParameterWith:[self interactorNewsList]];
                                  [initializer injectParameterWith:[self routerNewsList]];
                              }];
                          }];
}


- (id<FNSTableViewDelegate>)delegateNewsListTableView {
    return [TyphoonDefinition withClass:[FNSNewsListTableViewDelegate class]];
}

- (id<FNSTableViewDataSource>)dataSourceNewsListTableView {
    return [TyphoonDefinition withClass:[FNSNewsListTableViewDataSource class]];
}

- (id<FNSNewsListRouterInput>)routerNewsList {
    return [TyphoonDefinition withClass:[FNSNewsListRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(initWithTransitionHandler:) parameters:^(TyphoonMethod *initializer) {
                                  [initializer injectParameterWith:[self viewControllerNewsList]];
                              }];
                          }];
}

@end
