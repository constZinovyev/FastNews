//
//  FNSNewsDetailInteractor.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FNSNewsListInteractorInput.h"
#import "FNSMapper.h"
#import "FNSNewsService.h"
#import "FNSSourcesList.h"
#import "FNSReachability.h"

@interface FNSNewsDetailInteractor : NSObject <FNSNewsListInteractorInput>

- (instancetype)initWithNewsService:(id<FNSNewsService>)newsService
                          andMapper:(id<FNSMapper>)mapper
                    andReachability:(id<FNSReachability>)reachability
                     andSourcesList:(id<FNSSourcesList>) sourcesList;

@end
