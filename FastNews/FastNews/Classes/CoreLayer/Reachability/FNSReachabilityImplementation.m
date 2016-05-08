//
//  FNSReachabilityImplementation.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSReachabilityImplementation.h"
#import "Reachability.h"

@interface FNSReachabilityImplementation ()

@property (strong, nonatomic) Reachability *reachability;

@end

@implementation FNSReachabilityImplementation

- (instancetype)initWithReachability:(Reachability*)reachability {
    self = [super init];
    
    if (self){
        _reachability = reachability;
    };
    
    return self;
}

- (BOOL)connectedToInternet {
    NetworkStatus networkStatus = [self.reachability currentReachabilityStatus];
    return networkStatus != NotReachable;
}

@end
