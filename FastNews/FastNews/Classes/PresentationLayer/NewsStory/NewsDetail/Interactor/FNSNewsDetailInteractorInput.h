//
//  FNSNewsListInteractorInput.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

@protocol FNSNewsDetailInteractorInput <NSObject>

/**
 Method is used to obtain news plain object with newsId
 
 @param newsId link of news object
 
 @return FNSNewsObject
 */

- (id)obtainNewsWithNewsId:(NSString*)newsId;

@end