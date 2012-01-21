//
//  RootViewController.h
//  GCDSample
//
//  Created by 迫田 雅弘 on 12/01/21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingletonViewController.h"

@interface RootViewController : UIViewController {
	dispatch_queue_t global_queue;
	dispatch_group_t group;
}

- (void)runByFoundationMethod;
- (void)runQueueByGCDMethod;
- (void)runGroupByGCDMethod;

@end
