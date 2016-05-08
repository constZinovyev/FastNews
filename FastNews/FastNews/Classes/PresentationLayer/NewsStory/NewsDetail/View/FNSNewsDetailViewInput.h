//
//  FNSNewsListViewInput.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

@class FNSNewsObject;

@protocol FNSNewsDetailViewInput <NSObject>

- (void)setupViewWithNewsObject:(FNSNewsObject*)newsObject;

@end