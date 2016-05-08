//
//  FNSNewsListInteractorInput.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

@protocol FNSNewsDetailInteractorInput <NSObject>

- (id)obtainNewsWithNewsId:(NSString*)newsId;

@end