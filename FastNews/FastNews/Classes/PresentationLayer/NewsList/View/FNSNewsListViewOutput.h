//
//  FNSNewsListViewOutput.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

@class FNSNewsObject;
@class UIViewController;

@protocol FNSNewsListViewOutput <NSObject>

- (void)setupView;
- (void)didSelectCellWithNews:(FNSNewsObject*)news;

@end