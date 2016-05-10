//
//  FNSNewsDetailPresenterInput.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol FNSNewsDetailPresenterInput <RamblerViperModuleInput>

/**
 Method is used to configure NewsDetail module with news that id is equal objectId
 
 @param objectId link of news object
 */

- (void)configureCurrentModuleWithNewsObjectId:(NSString *)objectId;

@end