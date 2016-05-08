//
//  FNSSourceListImplementation.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSSourcesListImplementation.h"

static NSString *const kLinkLentaRSS = @"https://lenta.ru/rss";
static NSString *const kLinkGazetaRSS = @"http://www.gazeta.ru/export/rss/lenta.xml";

@interface FNSSourcesListImplementation ()

@property (nonatomic, strong) NSMutableArray* sources;

@end

@implementation FNSSourcesListImplementation

- (instancetype)init {
    
    self = [super init];
    
    if (self){
        _sources = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (instancetype)initWithDefaultSources {
    
    self = [self init];
    
    if (self){
        [_sources addObject:[NSURL URLWithString:kLinkLentaRSS]];
        [_sources addObject:[NSURL URLWithString:kLinkGazetaRSS]];
    }
    
    return self;
}

- (NSArray*)sourcesList {
    
    return [_sources copy];
}

@end
