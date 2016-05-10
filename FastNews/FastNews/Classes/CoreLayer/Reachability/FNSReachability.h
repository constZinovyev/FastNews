//
//  FNSReachability.h
//  FastNews
//
//  Created by Сonstantin Zinovyev on 08.05.16.
//  Copyright © 2016 ConstZin. All rights reserved.
//

/**
 
 This protocol describes objects which are check internet connection
 */

@protocol FNSReachability <NSObject>

/**
 *    Check internet connection
 *
 *    @return BOOL: NO - not reachable, YES - reachable
 */

- (BOOL)connectedToInternet;

@end