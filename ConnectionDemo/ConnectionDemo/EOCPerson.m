//
//  EOCPerson.m
//  ConnectionDemo
//
//  Created by shsun on 13/8/15.
//  Copyright (c) 2015 youdo. All rights reserved.
//

#import "EOCPerson.h"

@implementation EOCPerson

#pragma mark Common Methods
- (void)dealloc {
	[super dealloc];
}

- (id)init {
	if (!(self = [super init])) {
		return nil;
	}
    
    _firstName = @"how";
    
    
	return self;
}






@end
