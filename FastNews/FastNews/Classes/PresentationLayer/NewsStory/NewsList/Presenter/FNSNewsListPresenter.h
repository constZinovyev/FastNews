//
//  FNSNewsListPresenter.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FNSNewsListViewOutput.h"
#import "FNSNewsListInteractorInput.h"
#import "FNSNewsListViewInput.h"
#import "FNSNewsListRouterInput.h"

@interface FNSNewsListPresenter : NSObject <FNSNewsListViewOutput>

- (instancetype)initWithView:(id<FNSNewsListViewInput>)view
               andInteractor:(id<FNSNewsListInteractorInput>)interactor
                   andRouter:(id<FNSNewsListRouterInput>)router;
@end
