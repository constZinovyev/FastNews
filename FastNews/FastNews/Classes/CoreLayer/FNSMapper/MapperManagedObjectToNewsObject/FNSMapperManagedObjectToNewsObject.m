//
//  FNSMapperManagedObjectToNewsObject.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 07.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSMapperManagedObjectToNewsObject.h"
#import <MagicalRecord/MagicalRecord.h>
#import "FNSNewsItemManagedObject.h"
#import "FNSNewsObject.h"

@implementation FNSMapperManagedObjectToNewsObject

- (FNSNewsObject*)mappingFromObject:(FNSNewsItemManagedObject*)object {
    FNSNewsObject *filledObject = [[FNSNewsObject alloc] init];
    
    filledObject.title = object.title;
    filledObject.content = object.content;
    filledObject.link = [NSURL URLWithString:object.link];
    filledObject.author = object.author;
    filledObject.date = object.date;
    filledObject.imageURL = [NSURL URLWithString:object.imageURL];
    
    return filledObject;
}

@end
