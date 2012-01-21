//
//  RootViewController.m
//  GCDSample
//
//  Created by 迫田 雅弘 on 12/01/21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController()
- (void)doWork;
- (void)doWork2;
@end

@implementation RootViewController

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

- (void)viewDidLoad {
	[super viewDidLoad];
	
	// create thread queue
	dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
	
	// create thread queue group
	dispatch_group_t group = dispatch_group_create();
	
	// run
	/*
	dispatch_async(queue, ^{
		[self doWork];
	});
	dispatch_async(queue, ^{
		[self doWork2];
	});
	 */
	
	dispatch_group_async(group, queue, ^{
		[self doWork];
	});
	dispatch_group_async(group, queue, ^{
		[self doWork2];
	});
	NSLog(@"queue end!!");
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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	SingletonViewController *viewController = [[SingletonViewController alloc] initWithNibName:@"SingletonViewController" bundle:nil];
	[self.navigationController pushViewController:viewController animated:YES];
}

@end
