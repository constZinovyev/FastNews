//
//  FNSMultipleRSSRecieverImplementation.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 07.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FNSMultipleRSSReciever.h"

@protocol FNSRSSReciever;

@interface FNSMultipleRSSRecieverImplementation : NSObject <FNSMultipleRSSReciever>

- (instancetype)initWithRSSReciever:(id<FNSRSSReciever>)reciever;

@end
