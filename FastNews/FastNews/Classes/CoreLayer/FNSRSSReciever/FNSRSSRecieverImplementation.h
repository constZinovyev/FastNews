//
//  FNSRSSRecieverImplementation.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 06.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRSSFeedParser.h"
#import "FNSRSSReciever.h"

@interface FNSRSSRecieverImplementation : NSObject <FNSRSSReciever>

- (instancetype)initWithFeedParser:(BNRSSFeedParser*)parser;

@end