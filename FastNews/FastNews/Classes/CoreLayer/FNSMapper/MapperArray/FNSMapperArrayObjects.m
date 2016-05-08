//
//  FNSMapperArrayManagedObjectToNewsObject.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 07.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSMapperArrayObjects.h"

@interface FNSMapperArrayObjects ()

@property (nonatomic, strong) id<FNSMapper> mapperSingleObject;

@end

@implementation FNSMapperArrayObjects

- (instancetype)initWithSigleObjectMapper:(id<FNSMapper>)mapper{
    self = [super init];
    
    if (self) {
        _mapperSingleObject = mapper;
    }
    
    return self;
}

- (NSArray*)mappingFromObject:(NSArray*)array{
    NSMutableArray *filledArray = [[NSMutableArray alloc] init];
    
    for (id object in array){
        id filledObject = [self.mapperSingleObject mappingFromObject:object];
        [filledArray addObject:filledObject];
    }
    
    return filledArray;
}

@end
