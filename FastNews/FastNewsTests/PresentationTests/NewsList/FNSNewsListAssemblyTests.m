//
//  FNSNewsListAssembly.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RamblerTyphoonAssemblyTests.h"
#import "FNSNewsListAssembly.h"

#import "FNSNewsListViewController.h"
#import "FNSNewsListPresenter.h"
#import "FNSNewsListInteractor.h"
#import "FNSNewsListRouter.h"

@interface FNSNewsListAssemblyTests : RamblerTyphoonAssemblyTests

@property (strong, nonatomic) FNSNewsListAssembly *assembly;

@end

@implementation FNSNewsListAssemblyTests

- (void)setUp {
    [super setUp];
    
    self.assembly = [FNSNewsListAssembly new];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;
    
    [super tearDown];
}

- (void)testThatAssemblyCreatesListViewController {
    // given
    Class targetClass = [FNSNewsListViewController class];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    // when
    id result = [self.assembly viewControllerNewsList];
    
    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesListPresenter {
    // given
    Class targetClass = [FNSNewsListPresenter class];
    NSArray *dependencies = @[
                              RamblerSelector(view),
                              RamblerSelector(interactor)
                              ];
    // when
    id result = [self.assembly presenterNewsList];
    
    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesListInteractor {
    // given
    Class targetClass = [FNSNewsListInteractor class];
    NSArray *dependencies = @[
                              RamblerSelector(newsService),
                              RamblerSelector(mapper)
                              ];
    // when
    id result = [self.assembly interactorNewsList];
    
    // then
    [self verifyTargetDependency:result
                       withClass:targetClass
                    dependencies:dependencies];
}

@end
