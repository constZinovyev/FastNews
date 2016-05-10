//
//  FNSMapper.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 07.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

/**
 This protocol describes objects which are responsible for mapping objects into another objects.
 */

@protocol FNSMapper <NSObject>

/**
 *    Mapping one object to another
 *
 *    @param Object The object from which we take information
 *
 *    @return Еhe object which we get after mapping
 */

- (id)mappingFromObject:(id)Object;

@end