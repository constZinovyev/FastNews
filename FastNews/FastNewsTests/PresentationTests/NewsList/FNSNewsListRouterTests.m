//
//  FNSNewsListRouterTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ViperMcFlurry/ViperMcFlurry.h>
#import <OCMock/OCMock.h>
#import "FNSNewsListRouter.h"
#import "FNSNewsDetailPresenter.h"

@interface FNSNewsListRouterTests : XCTestCase
@property (strong, nonatomic) FNSNewsListRouter *router;
@property (strong, nonatomic) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;
@property (strong, nonatomic) FNSNewsDetailPresenter *presenter;

@end

@implementation FNSNewsListRouterTests

- (void)setUp {
    [super setUp];
    self.transitionHandler = OCMProtocolMock(@protocol(RamblerViperModuleTransitionHandlerProtocol));
    
    self.router = [[FNSNewsListRouter alloc] initWithTransitionHandler:self.transitionHandler];
}

- (void)tearDown {
    self.transitionHandler = nil;
    self.router = nil;
    
    [super tearDown];
}

- (void)testOpenModule {
    //given
    NSString *newsObjectId = @"id";
    self.presenter = OCMClassMock([FNSNewsDetailPresenter class]);
    XCTestExpectation *expectation = [self expectationWithDescription:@"Block not call"];
    RamblerViperOpenModulePromise *promise = OCMClassMock([RamblerViperOpenModulePromise class]);
    OCMStub([self.transitionHandler openModuleUsingSegue:OCMOCK_ANY]).andReturn(promise);
    OCMStub([promise thenChainUsingBlock:OCMOCK_ANY]).andDo(^(NSInvocation *invocation) {
        RamblerViperModuleLinkBlock block;
        [invocation getArgument:&block atIndex:2];
        block(self.presenter);
        [expectation fulfill];
    });
    
    //when
    [self.router openNewsDetailWithNewsId:newsObjectId];
    
    //then
    [self waitForExpectationsWithTimeout:2.0f handler:^(NSError * _Nullable error) {
        OCMVerify([self.presenter configureCurrentModuleWithNewsObjectId:newsObjectId]);
    }];
    
}

@end
