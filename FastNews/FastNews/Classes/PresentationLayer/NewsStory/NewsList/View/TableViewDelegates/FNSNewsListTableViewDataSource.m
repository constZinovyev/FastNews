//
//  FNSNewsListTableViewDataSource.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSNewsListTableViewDataSource.h"
#import "FNSNewsListTableViewCell.h"

static NSString *const cellIdentifier = @"FNSNewsListTableViewCell";

@implementation FNSNewsListTableViewDataSource

- (void)setDataForTableViewDataSource:(NSArray *)data{
    [self setFeed:data];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.feed count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FNSNewsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil];
        cell = (FNSNewsListTableViewCell *)[nib objectAtIndex:0];
    }
    
    id news = [self.feed objectAtIndex:indexPath.row];
    
    [cell fillWithObject:news];
    
    return cell;
}
@end
