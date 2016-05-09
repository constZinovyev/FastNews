//
//  FNSCoreAssembly.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

@protocol FNSSourceList;
@protocol FNSReachability;
@protocol FNSMapper;
@protocol FNSMultipleReciever;

@protocol FNSCoreAssembly <NSObject>

- (id<FNSSourceList>)sourcesList;

- (id<FNSReachability>)reachabilityInternetConnection;

- (id<FNSMultipleReciever>)multipleRSSReciever;

- (id<FNSMapper>)mapperFromManagedObjectToNewsObject;

- (id<FNSMapper>)mapperArrayBNFeedItems;

@end