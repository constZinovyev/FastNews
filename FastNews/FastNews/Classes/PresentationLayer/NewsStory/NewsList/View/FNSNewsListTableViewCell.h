//
//  FNSNewsListTableViewCell.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FNSNewsObject.h"

@interface FNSNewsListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *newsDate;
@property (weak, nonatomic) IBOutlet UILabel *newsAuthor;
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;

- (void)fillWithObject:(FNSNewsObject*)object;

@end
