//
//  FNSNewsService.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NewsCompletionBlock)(NSArray *feed, NSError *error);

@protocol FNSNewsService <NSObject>

- (id)obtainNewsWithNewsId:(NSString*)newsId;

- (id)obtainAllNewsListLocal;

- (void)obtainNewsListFromSources:(NSArray*)sources WithCompletionBlock:(NewsCompletionBlock)completionBlock;

@end