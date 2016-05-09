//
//  FNSNewsListAssembly.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import "FNSCoreAssemblyImplementation.h"
#import "FNSServicesAssemblyImplementation.h"
#import "FNSNewsListViewController.h"
#import "FNSNewsListInteractor.h"
#import "FNSNewsListPresenter.h"
#import "FNSNewsListRouter.h"

@interface FNSNewsListAssembly : TyphoonAssembly <RamblerInitialAssembly>

@property (strong, nonatomic) FNSCoreAssemblyImplementation *coreLayer;
@property (strong, nonatomic) FNSServicesAssemblyImplementation *services;

- (FNSNewsListViewController*)viewControllerNewsList;
- (FNSNewsListPresenter*)presenterNewsList;
- (FNSNewsListInteractor*)interactorNewsList;
- (FNSNewsListRouter*)routerNewsList;

@end
