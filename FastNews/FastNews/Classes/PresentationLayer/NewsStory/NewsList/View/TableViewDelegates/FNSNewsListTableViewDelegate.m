//
//  FNSNewsListTableViewDelegate.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSNewsListTableViewDelegate.h"

static CGFloat const RSSRNewsFeedTableViewCellHeight = 100.0f;

@implementation FNSNewsListTableViewDelegate

- (void)setDataForTableViewDelegate:(NSArray *)data{
    [self setFeed:data];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate didSelectCellWithNews:self.feed[indexPath.row]];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return RSSRNewsFeedTableViewCellHeight;
}

@end
