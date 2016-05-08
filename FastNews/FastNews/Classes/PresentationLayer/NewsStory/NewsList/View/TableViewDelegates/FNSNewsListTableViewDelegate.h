//
//  FNSNewsListTableViewDelegate.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 09.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FNSNewsTableViewOutput.h"
#import "FNSTableViewDelegate.h"

@interface FNSNewsListTableViewDelegate : NSObject <FNSTableViewDelegate>

@property (nonatomic, weak) id <FNSNewsTableViewOutput> delegate;
@property (strong, nonatomic) NSArray *feed;

@end
