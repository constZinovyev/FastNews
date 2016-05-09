//
//  FNSNewsDetailRouter.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FNSNewsListRouterInput.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@interface FNSNewsListRouter : NSObject <FNSNewsListRouterInput>

@property (weak, nonatomic) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

- (instancetype)initWithTransitionHandler:(id<RamblerViperModuleTransitionHandlerProtocol>)transitionHandler;

@end
