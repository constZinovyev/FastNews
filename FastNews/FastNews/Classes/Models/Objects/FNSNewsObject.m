//
//  FNSNewsObject.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 06.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSNewsObject.h"

@implementation FNSNewsObject

- (BOOL)isEqual:(FNSNewsObject*)object{
    
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[FNSNewsObject class]]) {
        return NO;
    }
    
    BOOL haveEqualContent = [self.content isEqualToString:object.content] && [self.title isEqualToString:object.title];
    BOOL haveEqualInfo = [self.author isEqualToString:object.author] && [self.date isEqualToDate:object.date];
    BOOL haveEqualURL = [self.link isEqual:object.link] && [self.imageURL isEqual:object.imageURL];
    
    return haveEqualContent && haveEqualInfo && haveEqualURL;
}

@end
