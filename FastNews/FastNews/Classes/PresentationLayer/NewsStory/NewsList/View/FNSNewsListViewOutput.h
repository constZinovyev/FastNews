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

/**
 
 Method is used to inform presenter that view needs to be configuered
 */

- (void)setupView;

/**

 Method is used to inform presenter that cell was selected
 */

- (void)didSelectCellWithNews:(FNSNewsObject*)news;

@end