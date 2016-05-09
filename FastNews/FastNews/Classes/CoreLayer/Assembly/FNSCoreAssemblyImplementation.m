//
//  FNSCoreAssemblyImplementation.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSCoreAssemblyImplementation.h"

#import "FNSSourcesListImplementation.h"

#import <Reachability/Reachability.h>
#import "FNSReachabilityImplementation.h"

#import "FNSMultipleRSSRecieverImplementation.h"
#import "FNSRSSRecieverImplementation.h"

#import "FNSMapperBNItemsToManagedObject.h"
#import "FNSMapperManagedObjectToNewsObject.h"
#import "FNSMapperArrayObjects.h"

@implementation FNSCoreAssemblyImplementation

#pragma mark Sources list

- (id <FNSSourceList>)sourcesList{
    return [TyphoonDefinition withClass:[FNSSourcesListImplementation class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithDefaultSources) parameters:nil];
    }];
}

#pragma mark Reachability

- (id <FNSReachability>)reachabilityInternetConnection{
    return [TyphoonDefinition withClass:[FNSReachabilityImplementation class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithReachability:) parameters:^(TyphoonMethod *initializer) {
            
            [initializer injectParameterWith:[self reachability]];
            
        }];
    }];
}
//TODO: Typhoon?
- (Reachability*)reachability{
    return [Reachability reachabilityForInternetConnection];
}

#pragma mark Multiple RSS Reciever

- (id<FNSMultipleReciever>)multipleRSSReciever{
    return [TyphoonDefinition withClass:[FNSMultipleRSSRecieverImplementation class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithRSSReciever:) parameters:^(TyphoonMethod *initializer) {
            
            [initializer injectParameterWith:[self RSSReciever]];
            
        }];
    }];
}

- (id<FNSRSSReciever>)RSSReciever{
    return [TyphoonDefinition withClass:[FNSRSSRecieverImplementation class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithFeedParser:) parameters:^(TyphoonMethod *initializer) {
            
            [initializer injectParameterWith:[self feedParser]];
            
        }];
    }];
}

- (BNRSSFeedParser*)feedParser {
    return [TyphoonDefinition withClass:[BNRSSFeedParser class]];
}

#pragma mark Mappers

- (id<FNSMapper>)mapperArrayBNFeedItems{
    return [TyphoonDefinition withClass:[FNSMapperArrayObjects class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithSigleObjectMapper:) parameters:^(TyphoonMethod *initializer) {
            
            [initializer injectParameterWith:[self mapperFromBNFeedItemsToManagedObject]];
            
        }];
    }];
}

- (id<FNSMapper>)mapperFromManagedObjectToNewsObject{
    return [TyphoonDefinition withClass:[FNSMapperManagedObjectToNewsObject class]];
}

- (id<FNSMapper>)mapperFromBNFeedItemsToManagedObject{
    return [TyphoonDefinition withClass:[FNSMapperBNItemsToManagedObject class]];
}

@end
