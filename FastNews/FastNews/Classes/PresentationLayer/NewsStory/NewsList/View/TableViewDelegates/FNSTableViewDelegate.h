//
//  FNSTableViewDelegate.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FNSTableViewDelegate <NSObject, UITableViewDelegate>

/**
 
 Method is used to set NewsList Delegate with news object from data
 */

- (void)setDataForTableViewDelegate:(NSArray*)data;

/**
 
 Method is used to set communication between view controller and table view delegate
 */

- (void)setDelegate:(id)delegate;

@end