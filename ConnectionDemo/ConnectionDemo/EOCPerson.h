//
//  EOCPerson.h
//  ConnectionDemo
//
//  Created by shsun on 13/8/15.
//  Copyright (c) 2015 youdo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EOCPerson : NSObject {
    
@public
    NSString *_firstName;
    NSString *_lastName;
    
@private
    NSString *_someInternalData;
    
    
}
@end