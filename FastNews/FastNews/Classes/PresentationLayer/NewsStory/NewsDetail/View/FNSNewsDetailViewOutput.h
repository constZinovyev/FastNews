//
//  FNSNewsListViewOutput.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

@protocol FNSNewsDetailViewOutput <NSObject>

/**

 Method is used to inform presenter that view needs to be configuered
 */

- (void)setupView;

@end