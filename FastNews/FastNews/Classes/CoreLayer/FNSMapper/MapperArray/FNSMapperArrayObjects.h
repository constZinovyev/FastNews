//
//  FNSMapperArrayManagedObjectToNewsObject.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 07.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FNSMapper.h"

@interface FNSMapperArrayObjects : NSObject <FNSMapper>

- (instancetype)initWithSigleObjectMapper:(id<FNSMapper>)mapper;

@end
