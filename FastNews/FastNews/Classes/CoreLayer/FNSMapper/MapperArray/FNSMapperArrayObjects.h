//
//  FNSMapperArrayManagedObjectToNewsObject.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 07.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FNSMapper.h"

/**
 It's an object for mapping NSArray of response objects
 
 - returns: NSArray mapping objects
 */

@interface FNSMapperArrayObjects : NSObject <FNSMapper>

/**
 *    The main initializer of FNSMapperArrayObjects
 *
 *    @param mapper Concrete mapper for signle object from array
 *
 *    @return FNSMapperArrayObjects
 */

- (instancetype)initWithSigleObjectMapper:(id<FNSMapper>)mapper;

@end
