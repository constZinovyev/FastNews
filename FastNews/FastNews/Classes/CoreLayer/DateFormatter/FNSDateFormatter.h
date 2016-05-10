//
//  FNSDateFormatter.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

@protocol FNSDateFormatter <NSObject>


/**
 Method is used to obtain string from date with format "HH:mm dd/MM"
 
 @param date NSDate object
 
 @return NSString object
 */

- (NSString*)stringFullTimeFromDate:(NSDate*)date;

@end