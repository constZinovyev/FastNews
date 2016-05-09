//
//  FNSServicesAssemblyImplementation.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSServicesAssemblyImplementation.h"
#import "FNSNewsServiceImplementation.h"

@implementation FNSServicesAssemblyImplementation

- (id <FNSNewsService>)newsService{
    
    return [TyphoonDefinition withClass:[FNSNewsServiceImplementation class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithMultipleRSSReciever:andMapper:) parameters:^(TyphoonMethod *initializer) {
            
            [initializer injectParameterWith:[self.coreLayerAssembly multipleRSSReciever]];
            [initializer injectParameterWith:[self.coreLayerAssembly mapperArrayBNFeedItems]];
            
        }];
    }];
}

@end
