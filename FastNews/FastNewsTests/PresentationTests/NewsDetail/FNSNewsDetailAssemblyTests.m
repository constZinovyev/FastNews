//
//  FNSNewsDetailAssemblyTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RamblerTyphoonAssemblyTests.h"
#import "FNSNewsDetailAssembly.h"

@interface FNSNewsDetailAssemblyTests : RamblerTyphoonAssemblyTests

@property (strong, nonatomic) FNSNewsDetailAssembly *assembly;

@end

@implementation FNSNewsDetailAssemblyTests

- (void)setUp {
    [super setUp];
    
    self.assembly = [FNSNewsDetailAssembly new];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;
    
    [super tearDown];
}

- (void)testThatAssemblyCreatesDetailViewController {
    // given
    Class targetClass = [FNSNewsDetailViewController class];
    NSArray *dependencies = @[
                              RamblerSelector(output),
                              RamblerSelector(dateFormatter)
                              ];
    // when
    id result = [self.assembly viewControllerDetail];
    
    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesDetailPresenter {
    // given
    Class targetClass = [FNSNewsDetailPresenter class];
    NSArray *dependencies = @[
                              RamblerSelector(view),
                              RamblerSelector(interactor)
                              ];
    // when
    id result = [self.assembly presenterDetail];
    
    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesDetailInteractor {
    // given
    Class targetClass = [FNSNewsDetailInteractor class];
    NSArray *dependencies = @[
                              RamblerSelector(newsService),
                              RamblerSelector(mapper)
                              ];
    // when
    id result = [self.assembly interactorDetail];
    
    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

@end
