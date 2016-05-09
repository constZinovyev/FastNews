//
//  FNSNewsDetailAssembly.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import "FNSCoreAssemblyImplementation.h"
#import "FNSServicesAssemblyImplementation.h"

#import "FNSNewsDetailViewController.h"
#import "FNSNewsDetailInteractor.h"
#import "FNSNewsDetailPresenter.h"

@interface FNSNewsDetailAssembly : TyphoonAssembly <RamblerInitialAssembly>

@property (strong, nonatomic) FNSCoreAssemblyImplementation *coreLayer;
@property (strong, nonatomic) FNSServicesAssemblyImplementation *services;

- (FNSNewsDetailViewController*)viewControllerDetail;
- (FNSNewsDetailPresenter*)presenterDetail;
- (FNSNewsDetailInteractor*)interactorDetail;

@end
