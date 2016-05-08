//
//  FNSReachabilityImplementation.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FNSReachability.h"

@class Reachability;

@interface FNSReachabilityImplementation : NSObject <FNSReachability>

- (instancetype)initWithReachability:(Reachability*)reachability;
    
@end
