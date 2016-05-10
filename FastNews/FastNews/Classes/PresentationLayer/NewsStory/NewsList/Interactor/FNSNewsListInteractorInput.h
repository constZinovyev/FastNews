//
//  FNSNewsListInteractorInput.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//
typedef void (^NewsCompletionBlock)(NSArray* feed, NSError *error);

@protocol FNSNewsListInteractorInput <NSObject>

/**
 Method is used to obtain news plain objects from news service
 
 @param completionBlock NewsCompletionBlock called upon completion the method, and returns News objects and NSError object if there is any
 */

- (void)obtainNewsListWithCompletionBlock:(NewsCompletionBlock)completionBlock;

@end