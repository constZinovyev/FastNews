//
//  FNSTableViewDelegate.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FNSTableViewDelegate <NSObject, UITableViewDelegate>

- (void)setDataForTableViewDelegate:(NSArray*)data;
- (void)setDelegate:(id)delegate;

@end