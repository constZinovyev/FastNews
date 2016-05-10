//
//  FNSNewsDetailPresenterTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "FNSNewsDetailPresenter.h"
#import "FNSNewsDetailInteractorInput.h"
#import "FNSNewsDetailViewInput.h"
#import "FNSNewsObject.h"

@interface FNSNewsDetailPresenterTests : XCTestCase

@property (nonatomic, strong) FNSNewsDetailPresenter *presenter;
@property (nonatomic, strong) id<FNSNewsDetailInteractorInput> interactor;
@property (nonatomic, weak) id<FNSNewsDetailViewInput> view;

@end

@implementation FNSNewsDetailPresenterTests

- (void)setUp {
    [super setUp];
    self.view = OCMProtocolMock(@protocol(FNSNewsDetailViewInput));
    self.interactor = OCMProtocolMock(@protocol(FNSNewsDetailInteractorInput));
    self.presenter = [[FNSNewsDetailPresenter alloc] initWithView:self.view
                                                    andInteractor:self.interactor];
}

- (void)tearDown {
    self.view = nil;
    self.interactor = nil;
    self.presenter = nil;
    
    [super tearDown];
}

- (void)testSetupView {
    //given
    FNSNewsObject *newsObject = [[FNSNewsObject alloc] init];
    OCMStub([self.interactor obtainNewsWithNewsId:OCMOCK_ANY]).andReturn(newsObject);
    
    //when
    [self.presenter setupView];
    
    //then
    OCMVerify([self.view setupViewWithNewsObject:newsObject]);
}

- (void)testConfigureModuleWithNewsId {
//    given
    NSString *newsId = @"newsId";
    NSString *obtainNewsId = nil;
//    when
    [self.presenter configureCurrentModuleWithNewsObjectId:newsId];
//    then
    if ([self.presenter respondsToSelector:@selector(newsId)]) {
        obtainNewsId = [self.presenter performSelector:@selector(newsId)];
    }
    
    XCTAssertEqualObjects(obtainNewsId, newsId);
    
}


@end
