//
//  FNSNewsService.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NewsCompletionBlock)(NSArray *feed, NSError *error);
/**
 *    The service is designed to obtain News objects
 */
@protocol FNSNewsService <NSObject>

/**
 *    Method is used to obtain News object from CoreData
 *
 *    @param newsId News object link
 *
 *    @return Managed Objects subclass
 */
- (id)obtainNewsWithNewsId:(NSString*)newsId;

/**
 *    Method is used to obtain News object from CoreData
 *
 *    @return Array Managed Objects subclass
 */

- (id)obtainAllNewsListLocal;

/**
 *     Method is used to obtain News object by from URLs in array sources
 *
 *    @param sources         Array URL RSS feed
 *    @param completionBlock NewsCompletionBlock called upon completion the method, and returns Array Managed Objects subclass object and NSError object if there is any
 */
- (void)obtainNewsListFromSources:(NSArray*)sources WithCompletionBlock:(NewsCompletionBlock)completionBlock;

@end