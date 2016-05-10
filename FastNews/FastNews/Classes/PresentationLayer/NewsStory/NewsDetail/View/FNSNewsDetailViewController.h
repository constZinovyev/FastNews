//
//  FNSNewsDetailViewController.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FNSNewsDetailViewInput.h"
#import "FNSNewsDetailViewOutput.h"
#import "FNSDateFormatter.h"

@interface FNSNewsDetailViewController : UIViewController <FNSNewsDetailViewInput>

@property (nonatomic, strong) id<FNSNewsDetailViewOutput> output;

@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UITextView *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *newsPubDate;
@property (weak, nonatomic) IBOutlet UILabel *newsAuthor;
@property (weak, nonatomic) IBOutlet UITextView *newsContent;

@end
