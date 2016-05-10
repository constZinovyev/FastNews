//
//  FNSReachabilityTests.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "FNSReachabilityImplementation.h"
#import "Reachability.h"

@interface FNSReachabilityTests : XCTestCase

@property (strong, nonatomic) FNSReachabilityImplementation *reachabilityInternetConnection;
@property (strong, nonatomic) id reachability;
@end

@implementation FNSReachabilityTests

- (void)setUp {
    [super setUp];
    self.reachability = OCMClassMock([Reachability class]);
    self.reachabilityInternetConnection = [[FNSReachabilityImplementation alloc] initWithReachability:self.reachability];
}

- (void)tearDown {
    self.reachability = nil;
    self.reachabilityInternetConnection = nil;
    
    [super tearDown];
}

- (void)testSuccessInternerConnection {
    
//    given
    OCMStub([self.reachability currentReachabilityStatus]).andReturn(ReachableViaWiFi);
    
//    when
    BOOL isSuccessConnectedInternet = [self.reachabilityInternetConnection connectedToInternet];
    
//    then
    XCTAssertTrue(isSuccessConnectedInternet);
}

- (void)testFailureInternerConnection {
    
    //    given
    OCMStub([self.reachability currentReachabilityStatus]).andReturn(NotReachable);
    
    //    when
    BOOL isFailConnectedInternet = ![self.reachabilityInternetConnection connectedToInternet];
    
    //    then
    XCTAssertTrue(isFailConnectedInternet);
}

@end
