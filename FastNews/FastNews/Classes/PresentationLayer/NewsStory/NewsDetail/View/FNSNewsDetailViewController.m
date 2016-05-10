//
//  FNSNewsDetailViewController.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSNewsDetailViewController.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import "FNSNewsObject.h"
#import "FNSDateFormatterImplementation.h"

@interface FNSNewsDetailViewController ()

@end

@implementation FNSNewsDetailViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.output setupView];
}

- (void)setupViewWithNewsObject:(FNSNewsObject*)newsObject{
    [self fillViewWithNewsObject:newsObject];
}

- (void)fillViewWithNewsObject:(FNSNewsObject*)newsObject{
    self.newsTitle.text = newsObject.title;
    self.newsAuthor.text = newsObject.author;
    self.newsContent.text = newsObject.content;
    self.newsContent.text = [self.newsContent.text stringByReplacingCharactersInRange:NSMakeRange(0,0) withString:@"    "];
    self.newsPubDate.text = [self.dateFormatter stringFullTimeFromDate:newsObject.date];
    UIImage *image = [UIImage imageNamed:newsObject.link.host];
    [self.newsImage sd_setImageWithURL:newsObject.imageURL
                      placeholderImage:image];
}

@end
