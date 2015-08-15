//
//  EOCEmployee.h
//  ConnectionDemo
//
//  Created by shsun on 13/8/15.
//  Copyright (c) 2015 youdo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, EOCEmployeeType) {
    EOCEmployeeTypeDeveloper,
    EOCEmployeeTypeDesigner,
    EOCEmployeeTypeFinance,
};


@interface EOCEmployee : NSObject


@property (copy) NSString *name;
@property NSUInteger salary;

// Helper for creating Employee objects
+ (EOCEmployee*)employeeWithType:(EOCEmployeeType)type;

// Make Employees do their respective day's work
- (void)doADaysWork;

@end
