//
//  SingletonViewController.h
//  GCDSample
//
//  Created by 迫田 雅弘 on 12/01/21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingletonViewController : UIViewController

- (void)runMainQueueByFoundationMethod;
- (void)runMainQueueByGCDMethod;

@end
