//
//  FNSNewsListPresenter.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "FNSNewsListPresenter.h"
#import "FNSNewsListInteractorInput.h"
#import "FNSNewsListViewInput.h"
#import "FNSNewsListRouterInput.h"
#import "FNSNewsObject.h"

static const CGFloat kTestExpectationTimeout = 2.0f;

@interface FNSNewsListPresenterTests : XCTestCase

@property (nonatomic, strong) FNSNewsListPresenter *presenter;
@property (nonatomic, strong) id<FNSNewsListViewInput> view;
@property (nonatomic, strong) id<FNSNewsListInteractorInput> interactor;
@property (nonatomic, strong) id<FNSNewsListRouterInput> router;

@end

@implementation FNSNewsListPresenterTests

- (void)setUp {
    [super setUp];
    
    self.view = OCMProtocolMock(@protocol(FNSNewsListViewInput));
    self.interactor = OCMProtocolMock(@protocol(FNSNewsListInteractorInput));
    self.router = OCMProtocolMock(@protocol(FNSNewsListRouterInput));
    self.presenter = [[FNSNewsListPresenter alloc] initWithView:self.view
                                                  andInteractor:self.interactor
                                                      andRouter:self.router];
}

- (void)tearDown {
    self.view = nil;
    self.interactor = nil;
    self.router = nil;
    self.presenter = nil;
    
    [super tearDown];
}

- (void)testDidSelectCellWithNewsObject {
    //given
    NSString *newsId = @"newsId";
    FNSNewsObject *newsObject = [[FNSNewsObject alloc] init];
    newsObject.link = [NSURL URLWithString:newsId];
    
    //when
    [self.presenter didSelectCellWithNews:newsObject];
    
    //then
    OCMVerify([self.router openNewsDetailWithNewsId:newsId]);
}

- (void)testSetupView {
    NSArray *feed = @[];
    XCTestExpectation *expectation = [self expectationWithDescription:@"Block not call"];
    //given
    OCMStub([self.interactor obtainNewsListWithCompletionBlock:OCMOCK_ANY]).andDo(^(NSInvocation *invocation) {
        void (^block)(NSArray*, NSError*);
        [invocation getArgument:&block atIndex:2];
        block(feed,nil);
        [expectation fulfill];
    });
    //when
    [self.presenter setupView];
    
    //then
    [self waitForExpectationsWithTimeout:kTestExpectationTimeout handler:^(NSError * _Nullable error) {
        OCMVerify([self.view setupViewWithEventList:feed]);
    }];
}

@end
