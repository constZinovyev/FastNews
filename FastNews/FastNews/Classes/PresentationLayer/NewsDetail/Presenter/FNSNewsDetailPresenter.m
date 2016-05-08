//
//  FNSNewsDetailPresenter.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSNewsDetailPresenter.h"

@interface FNSNewsDetailPresenter ()

@property (strong, nonatomic) NSString *newsId;
@property (nonatomic, weak) id<FNSNewsDetailViewInput> view;
@property (nonatomic, strong) id<FNSNewsDetailInteractorInput> interactor;

@end

@implementation FNSNewsDetailPresenter

- (instancetype)initWithView:(id<FNSNewsDetailViewInput>)view
                   andInteractor:(id<FNSNewsDetailInteractorInput>)interactor {
    self = [super init];
    
    if (self) {
        _view = view;
        _interactor = interactor;
    }
    
    return self;
}

- (void)setupView{
    id newsObject = [self.interactor obtainNewsWithNewsId:self.newsId];
    [self.view setupViewWithNewsObject:newsObject];
    
}

- (void)configureCurrentModuleWithNewsObjectId:(NSString *)objectId{
    self.newsId = objectId;
}

@end
