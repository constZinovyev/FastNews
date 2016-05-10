//
//  FNSNewsListRouterInput.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

@class UIViewController;

@protocol FNSNewsListRouterInput <NSObject>

/**
 
 Method is used to initiate transition to the NewsDetail
 
 @param NewsId NSString link news object
 */

- (void)openNewsDetailWithNewsId:(NSString *)NewsId;

@end