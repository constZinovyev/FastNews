//
//  FNSServicesAssemblyTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RamblerTyphoonAssemblyTests.h"
#import "FNSServicesAssemblyImplementation.h"
#import "FNSNewsServiceImplementation.h"

@interface FNSServicesAssemblyTests : RamblerTyphoonAssemblyTests

@property (strong, nonatomic) FNSServicesAssemblyImplementation *servicesAssembly;

@end

@implementation FNSServicesAssemblyTests

- (void)setUp {
    [super setUp];
    
    self.servicesAssembly = [FNSServicesAssemblyImplementation new];
    [self.servicesAssembly activate];
}

- (void)tearDown {
    self.servicesAssembly = nil;
    
    [super tearDown];
}

- (void)testThatAssemblyCreatesMultipleRSSReciever {
    // given
    Class targetClass = [FNSNewsServiceImplementation class];
    NSArray *dependencies = @[
                              RamblerSelector(multipleRSSReciever),
                              RamblerSelector(mapper)
                              ];
    // when
    id result = [self.servicesAssembly newsService];
    
    // then
    [self verifyTargetDependency:result withClass:targetClass dependencies:dependencies];
}

@end
