//
//  FNSMapperBNItemsToManagedObjectTest.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 07.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <MagicalRecord/MagicalRecord.h>
#import "FNSMapperManagedObjectToNewsObject.h"

#import "FNSNewsItemManagedObject.h"
#import "FNSNewsObject.h"

@interface FNSMapperManagedObjectToNewsObjectTests : XCTestCase

@property (strong, nonatomic) FNSMapperManagedObjectToNewsObject *mapper;

@end

@implementation FNSMapperManagedObjectToNewsObjectTests

- (void)setUp {
    [super setUp];
    
    self.mapper = [[FNSMapperManagedObjectToNewsObject alloc] init];
    [MagicalRecord setupCoreDataStackWithInMemoryStore];
}

- (void)tearDown {
    self.mapper = nil;
    [MagicalRecord cleanUp];
    
    [super tearDown];
}

- (void)testSuccessMapperBNItemToManagedObject {
    //given
    NSString *title = @"title";
    NSString *content = @"content";
    NSString *author = @"author";
    NSURL *url = [NSURL URLWithString:@"url"];
    NSURL *imageURL = [NSURL URLWithString:@"imageURL"];
    NSDate *date = [NSDate date];
    
    FNSNewsItemManagedObject *managedObject = [FNSNewsItemManagedObject MR_createEntity];
    managedObject.title = title;
    managedObject.content = content;
    managedObject.author = author;
    managedObject.link = [url absoluteString];
    managedObject.date = date;
    managedObject.imageURL = [imageURL absoluteString];
    
    FNSNewsObject *rightObject = [[FNSNewsObject alloc] init];
    rightObject.title = title;
    rightObject.content = content;
    rightObject.author = author;
    rightObject.link = url;
    rightObject.imageURL = imageURL;
    rightObject.date = date;
    
    //when
    FNSNewsObject *testObject = [self.mapper mappingFromObject:managedObject];
    
    //then
    XCTAssertEqualObjects(testObject, rightObject);
    
}


@end
