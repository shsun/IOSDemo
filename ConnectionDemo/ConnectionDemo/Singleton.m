//
//  Singleton.m
//  ConnectionDemo
//
//  Created by shsun on 15/8/15.
//  Copyright (c) 2015 youdo. All rights reserved.
//

#import "Singleton.h"
#import <pthread.h>

@implementation Singleton

+ (Singleton *)sharedInstance
{
    static Singleton *instance;
    
    
    // the pointer to a dispatch_once_t that is used to test whether the block has completed or not.
    // it will be reset in background when the block completed
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[Singleton alloc] init];
    });
    
    
    
    
    
    
    return instance;
}


- (void) sayHi
{
    NSLog(@"sayHi.......");
}











@end














