//
//  FNSSourceList.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 This protocol describes object that contained sources RSS feed
 */

@protocol FNSSourcesList <NSObject>
/**
 *    Init object that contained default sources: lenta.ru and gazeta.ru
 *
 *    @return FNSSourcesList
 */

- (instancetype)initWithDefaultSources;

/**
 *    All sources that contained in SourcesList object
 *
 *    @return NSArray <NSURL>
 */

- (NSArray*)sourcesList;

@end