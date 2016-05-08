//
//  FNSNewsListViewInput.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FNSNewsListViewInput <NSObject>

-(void)setupViewWithEventList:(NSArray*)feed;

@end