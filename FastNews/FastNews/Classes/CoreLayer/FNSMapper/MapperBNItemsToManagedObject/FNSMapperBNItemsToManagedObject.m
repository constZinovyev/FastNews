//
//  FNSMapperBNItemsToManagedObject.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 07.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSMapperBNItemsToManagedObject.h"

#import <MagicalRecord/MagicalRecord.h>

#import "BNRSSFeedItem.h"
#import "BNRSSFeedItemEnclosure.h"
#import "FNSNewsItemManagedObject.h"

@implementation FNSMapperBNItemsToManagedObject

- (FNSNewsItemManagedObject*)mappingFromObject:(BNRSSFeedItem*)object{
    FNSNewsItemManagedObject *filledObject = [FNSNewsItemManagedObject MR_createEntity];
    
    filledObject.title = object.title;
    filledObject.content = object.description;
    filledObject.link = [object.link absoluteString];
    filledObject.author = object.author ? object.author : object.link.host;
    filledObject.date = object.pubDate;
    filledObject.imageURL = [object.enclosure.url absoluteString];
    
    return filledObject;
}

@end
