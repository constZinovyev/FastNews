//
//  FNSNewsListInteractorInput.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//
typedef void (^NewsCompletionBlock)(NSArray* feed, NSError *error);

@protocol FNSNewsListInteractorInput <NSObject>

- (void)obtainNewsListWithCompletionBlock:(NewsCompletionBlock)completionBlock;

@end