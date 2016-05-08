//
//  FNSNewsListTableViewCell.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSNewsListTableViewCell.h"
#import "FNSDateFormatterImplementation.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation FNSNewsListTableViewCell

- (void)fillWithObject:(FNSNewsObject*)object {
    id<FNSDateFormatter> dateFormatter = [[FNSDateFormatterImplementation alloc] init];
    self.newsTitle.text = object.title;
    self.newsAuthor.text = object.author;
    self.newsDate.text = [dateFormatter stringFullTimeFromDate:object.date];
    [self.newsImageView sd_setImageWithURL:object.imageURL
                          placeholderImage:[UIImage imageNamed:object.link.host]];
}

@end
