//
//  ViewController.m
//  ConnectionDemo
//
//  Created by shsun on 12/8/15.
//  Copyright (c) 2015 youdo. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import "EOCEmployee.h"
#import "EOCEmployeeDeveloper.h"
#import "Singleton.h"

@interface ViewController ()
/*
typedef NS_ENUM(NSUInteger, XAdConnectionState) {
    XAdConnectionStateDisconnected = 1,
    XAdConnectionStateConnecting,
    XAdConnectionStateConnected,
};
*/
@end

@implementation ViewController


__weak id reference = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [[Singleton sharedInstance] sayHi];
    
    
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        // read image
        NSURL * url = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"];
        NSData * data = [[NSData alloc]initWithContentsOfURL:url];
        //
        if (data != nil) {
            UIImage *image = [[UIImage alloc]initWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self _updateUIWith:image];
            });
        }
    });
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        // some one-time task
    });
    
}


-(void) _updateUIWith:(UIImage *)image
{
    UIImageView* view = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view.image = image;
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    
    [view release];
}



/*
 UITextView* view = [[UITextView alloc] initWithFrame:CGRectMake(100, 100, 200, 20)];
 view.text = @"if i were a boy again";
 [self.view addSubview:view];
 */


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];

    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


/*

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    EOCPerson* p = [[EOCPerson alloc] init];
    
    NSLog(@"-->>%@", p->_firstName);
    

    [p release];
    
    
    
    
    id maybeAnArray = [NSMutableArray arrayWithObject:@"abc"];
    if ([maybeAnArray class] == [NSArray class]) {
        NSLog(@"yes");
    } else{
        NSLog(@"no");
    }
    
    
    EOCEmployee *dev = [EOCEmployee employeeWithType:EOCEmployeeTypeDeveloper];
    EOCEmployee *des = [EOCEmployee employeeWithType:EOCEmployeeTypeDesigner];
    EOCEmployee *fin = [EOCEmployee employeeWithType:EOCEmployeeTypeFinance];

    
    
    id obj1 = [NSArray alloc]; // __NSPlacehodlerArray *
    id obj2 = [NSArray alloc];  // __NSPlacehodlerArray *

    
    id obj3 = [obj1 init];  // __NSArrayI *
    id obj4 = [obj2 init];  // __NSArrayM *
    
    
    
    NSArray *arr1 = [[NSArray alloc] init];
    NSArray *arr2 = [[NSArray alloc] init];
    
    
    id str1 = [NSString alloc];
    id str2 = [NSString alloc];
    
    
    NSString *a1 = [[NSString alloc] init];
    NSString *a2 = [[NSString alloc] init];
}
*/


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
