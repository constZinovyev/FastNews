//
//  FNSDateFormatterImplementation.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FNSDateFormatter;

@interface FNSDateFormatterImplementation : NSObject <FNSDateFormatter>

- (NSString*)stringFullTimeFromDate:(NSDate*)date;

@end
