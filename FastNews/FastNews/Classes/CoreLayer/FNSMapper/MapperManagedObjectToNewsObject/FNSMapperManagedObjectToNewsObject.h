//
//  FNSMapperManagedObjectToNewsObject.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 07.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FNSMapper.h"
#import "FNSNewsItemManagedObject.h"
#import "FNSNewsObject.h"

@interface FNSMapperManagedObjectToNewsObject : NSObject <FNSMapper>

- (FNSNewsObject*)mappingFromObject:(FNSNewsItemManagedObject*)object;

@end
