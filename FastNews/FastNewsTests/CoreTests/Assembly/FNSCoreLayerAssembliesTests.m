//
//  FNSCoreLayerAssembliesTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RamblerTyphoonAssemblyTests.h"
#import "FNSCoreAssemblyImplementation.h"

#import "FNSSourcesListImplementation.h"

#import <Reachability/Reachability.h>
#import "FNSReachabilityImplementation.h"

#import "FNSMultipleRSSRecieverImplementation.h"
#import "FNSRSSRecieverImplementation.h"

#import "FNSMapperBNItemsToManagedObject.h"
#import "FNSMapperManagedObjectToNewsObject.h"
#import "FNSMapperArrayObjects.h"

@interface FNSCoreLayerAssembliesTests : RamblerTyphoonAssemblyTests

@property (strong, nonatomic) FNSCoreAssemblyImplementation *assembly;

@end

@implementation FNSCoreLayerAssembliesTests

- (void)setUp {
    [super setUp];
    
    self.assembly = [FNSCoreAssemblyImplementation new];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;
    
    [super tearDown];
}

- (void)testThatAssemblyCreatesSourcesList {
    // given
    Class targetClass = [FNSSourcesListImplementation class];
    
    // when
    id result = [self.assembly sourcesList];
    
    // then
    [self verifyTargetDependency:result
                       withClass:targetClass];
}

- (void)testThatAssemblyCreatesReachabilityInternetConnection {
    // given
    Class targetClass = [FNSReachabilityImplementation class];
    NSArray *dependencies = @[
                              RamblerSelector(reachability)
                              ];
    // when
    id result = [self.assembly reachabilityInternetConnection];
    
    // then
    [self verifyTargetDependency:result withClass:targetClass dependencies:dependencies];
}

- (void)testThatAssemblyCreatesMultipleRSSReciever {
    // given
    Class targetClass = [FNSMultipleRSSRecieverImplementation class];
    NSArray *dependencies = @[
                              RamblerSelector(recieverRSS)
                              ];
    // when
    id result = [self.assembly multipleRSSReciever];
    
    // then
    [self verifyTargetDependency:result withClass:targetClass dependencies:dependencies];
}
//
- (void)testThatAssemblyCreatesMapperArrayBNFeedItems {
    // given
    Class targetClass = [FNSMapperArrayObjects class];
    NSArray *dependencies = @[
                              RamblerSelector(mapperSingleObject)
                              ];
    // when
    id result = [self.assembly mapperArrayBNFeedItems];
    
    // then
    [self verifyTargetDependency:result withClass:targetClass dependencies:dependencies];
}

- (void)testThatAssemblyCreatesMapperFromManagedObjectToNewsObject {
    // given
    Class targetClass = [FNSMapperManagedObjectToNewsObject class];
    
    // when
    id result = [self.assembly mapperFromManagedObjectToNewsObject];
    
    // then
    [self verifyTargetDependency:result withClass:targetClass];
}

@end
