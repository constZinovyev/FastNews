//
//  FNSNewsDetailAssembly.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSNewsDetailAssembly.h"

@implementation FNSNewsDetailAssembly

- (FNSNewsDetailViewController*)viewControllerDetail{
    
    return [TyphoonDefinition withClass:[FNSNewsDetailViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output) with:[self presenterDetail]];
                              [definition injectProperty:@selector(dateFormatter) with:[self.coreLayer dateFormatter]];
                          }];
}

- (FNSNewsDetailInteractor*)interactorDetail{
    
    return [TyphoonDefinition withClass:[FNSNewsDetailInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(initWithNewsService:andMapper:) parameters:^(TyphoonMethod *initializer) {
                                  
                                  [initializer injectParameterWith:[self.services newsService]];
                                  [initializer injectParameterWith:[self.coreLayer mapperFromManagedObjectToNewsObject]];
                                  
                              }];
                          }];
}

- (FNSNewsDetailPresenter*)presenterDetail{
    
    return [TyphoonDefinition withClass:[FNSNewsDetailPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(initWithView:andInteractor:) parameters:^(TyphoonMethod *initializer) {
                                  
                                  [initializer injectParameterWith:[self viewControllerDetail]];
                                  [initializer injectParameterWith:[self interactorDetail]];
                                  
                              }];
                          }];
}


@end
