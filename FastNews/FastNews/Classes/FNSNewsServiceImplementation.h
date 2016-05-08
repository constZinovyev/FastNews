//
//  FNSNewsServiceImplementation.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FNSNewsService.h"
#import "FNSMultipleRSSReciever.h"
#import "FNSMapper.h"

@interface FNSNewsServiceImplementation : NSObject <FNSNewsService>

- (instancetype)initWithMultipleRSSReciever:(id <FNSMultipleRSSReciever>)reciever andMapper:(id <FNSMapper>)mapper;

@end
