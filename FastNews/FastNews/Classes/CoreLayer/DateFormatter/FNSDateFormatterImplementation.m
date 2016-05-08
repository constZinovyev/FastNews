//
//  FNSDateFormatterImplementation.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSDateFormatterImplementation.h"
#import "FNSDateFormatter.h"

static NSString *const kDayMonthTimeDateFormat = @"HH:mm dd/MM";

@implementation FNSDateFormatterImplementation

- (NSString*)stringFullTimeFromDate:(NSDate*)date {
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:kDayMonthTimeDateFormat];
    
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    return formattedDate;
}

@end
