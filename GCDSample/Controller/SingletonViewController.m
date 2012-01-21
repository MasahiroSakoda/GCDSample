//
//  SingletonViewController.m
//  GCDSample
//
//  Created by 迫田 雅弘 on 12/01/21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SingletonViewController.h"

@interface SingletonViewController()
- (void)doWork;
- (void)doWork2;
@end

@implementation SingletonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	/*
	dispatch_queue_t queue = dispatch_queue_create(@"com.forceoperationx.gcdsample", NULL);
	dispatch_async(queue, ^{
		[self doWork];
	});
	dispatch_async(queue, ^{
		[self doWork2];
	});
	 */
	
	NSOperationQueue *queue = [[NSOperationQueue alloc] init];
	[queue addOperationWithBlock:^{
		[self doWork];
	}];
	[queue addOperationWithBlock:^{
		[self doWork2];
	}];
	
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)doWork {
	for (NSInteger i = 0; i < 15; i++) {
		NSLog(@"Count-A: %d", i);
		[NSThread sleepForTimeInterval:1.0];
	}
}

- (void)doWork2 {
	for (NSInteger i = 0; i < 15; i++) {
		NSLog(@"Count-B: %d", i);
		[NSThread sleepForTimeInterval:1.0];
	}
}

@end
