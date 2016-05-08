//
//  FNSNewsListPresenter.m
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

#import "FNSNewsListPresenter.h"
#import "FNSNewsObject.h"



@interface FNSNewsListPresenter ()

@property (nonatomic, weak) id<FNSNewsListViewInput> view;
@property (nonatomic, strong) id<FNSNewsListInteractorInput> interactor;
@property (nonatomic, strong) id<FNSNewsListRouterInput> router;

@end

@implementation FNSNewsListPresenter

- (instancetype)initWithView:(id<FNSNewsListViewInput>)view
               andInteractor:(id<FNSNewsListInteractorInput>)interactor
                   andRouter:(id<FNSNewsListRouterInput>)router {
    self = [super init];
    
    if (self) {
        _router = router;
        _view = view;
        _interactor = interactor;
    }
    
    return self;
}

- (void)setupView {
    __weak typeof(self) weakSelf = self;
    [self.interactor obtainNewsListWithCompletionBlock:^(id feed, NSError *error) {
        [weakSelf.view setupViewWithEventList:feed];
    }];
}

-(void)didSelectCellWithNews:(FNSNewsObject*)news{
    [self.router openNewsDetailWithNewsId:[news.link absoluteString]];
    
}

@end
