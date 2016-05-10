//
//  FNSNewsTableViewOutput.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

@protocol FNSNewsTableViewOutput <NSObject>

/**

 Method is used to inform view that cell was selected
 */

- (void)didSelectCellWithNews:(id)news;

@end