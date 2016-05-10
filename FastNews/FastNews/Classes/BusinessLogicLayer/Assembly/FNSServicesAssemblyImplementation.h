//
//  FNSServicesAssemblyImplementation.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Typhoon/Typhoon.h>

#import "FNSServicesAssembly.h"
#import "RamblerInitialAssembly.h"
#import "FNSCoreAssemblyImplementation.h"

@interface FNSServicesAssemblyImplementation : TyphoonAssembly <FNSServicesAssembly, RamblerInitialAssembly>

@property (strong, nonatomic) FNSCoreAssemblyImplementation *coreLayerAssembly;

@end
