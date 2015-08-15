//
//  Singleton.h
//  ConnectionDemo
//
//  Created by shsun on 15/8/15.
//  Copyright (c) 2015 youdo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject {
    
}


+ (Singleton *)sharedInstance;

- (void) sayHi;

@end
