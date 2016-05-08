//
//  FNSNewsDetailInteractor.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FNSNewsDetailInteractorInput.h"
#import "FNSNewsService.h"
#import "FNSMapper.h"

@interface FNSNewsDetailInteractor : NSObject <FNSNewsDetailInteractorInput>

- (instancetype)initWithNewsService:(id<FNSNewsService>)newsService
                          andMapper:(id<FNSMapper>)mapper;

@end
