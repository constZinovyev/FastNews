//
//  FNSServicesAssembly.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

@protocol FNSNewsService;

@protocol FNSServicesAssembly <NSObject>

- (id<FNSNewsService>)newsService;

@end