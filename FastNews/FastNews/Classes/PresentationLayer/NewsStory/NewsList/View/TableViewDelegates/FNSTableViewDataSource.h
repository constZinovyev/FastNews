//
//  FNSTableViewDataSource.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FNSTableViewDataSource <NSObject, UITableViewDataSource>

/**

 Method is used to set NewsList DataSource with news object from data
 */

- (void)setDataForTableViewDataSource:(NSArray*)data;

@end