//
//  FNSNewsDetailPresenter.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FNSNewsDetailPresenterInput.h"
#import "FNSNewsDetailInteractorInput.h"
#import "FNSNewsDetailViewInput.h"
#import "FNSNewsDetailViewOutput.h"

@interface FNSNewsDetailPresenter : NSObject <FNSNewsDetailPresenterInput, FNSNewsDetailViewOutput>

- (instancetype)initWithView:(id<FNSNewsDetailViewInput>)view
               andInteractor:(id<FNSNewsDetailInteractorInput>)interactor;

@end
