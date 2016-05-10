//
//  FNSNewsServiceImplementation.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSNewsServiceImplementation.h"

#import <MagicalRecord/MagicalRecord.h>
#import <CoreData/CoreData.h>

#import "FNSNewsItemManagedObject.h"

@interface FNSNewsServiceImplementation ()

@property (strong, nonatomic) id<FNSMultipleRSSReciever> multipleRSSReciever;
@property (strong, nonatomic) id<FNSMapper> mapper;

@end

@implementation FNSNewsServiceImplementation

- (instancetype)initWithMultipleRSSReciever:(id<FNSMultipleRSSReciever>)reciever andMapper:(id<FNSMapper>)mapper {
    self = [super init];
    
    if (self) {
        _multipleRSSReciever = reciever;
        _mapper = mapper;
    }
    
    return self;
}

- (id)obtainNewsWithNewsId:(NSString*)newsId{
    FNSNewsItemManagedObject *newsManagedObject = [FNSNewsItemManagedObject MR_findFirstByAttribute:@"link" withValue:newsId];
    return newsManagedObject;
}

- (id)obtainAllNewsListLocal{
    NSArray *feedNews = [FNSNewsItemManagedObject MR_findAll];
    return feedNews;
}

- (void)obtainNewsListFromSources:(NSArray *)sources WithCompletionBlock:(NewsCompletionBlock)completionBlock {
    [FNSNewsItemManagedObject MR_truncateAll];
    
    [self.multipleRSSReciever obtainRSSFeedFromSources:sources withCompletionBlock:^(NSArray *feed, NSError *error) {
        if (error) {
            completionBlock(nil,error);
        }
        else {
            NSArray *feedManagedObjects = [self.mapper mappingFromObject:feed];
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError * _Nullable error) {
                completionBlock(feedManagedObjects, nil);
            }];
        }
    }];
}

@end
