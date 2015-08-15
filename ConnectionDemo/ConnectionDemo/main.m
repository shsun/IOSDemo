//
//  main.m
//  ConnectionDemo
//
//  Created by shsun on 12/8/15.
//  Copyright (c) 2015 youdo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreFoundation/CoreFoundation.h>
#import <stdio.h>

#import "AppDelegate.h"


void testSourceWithGCD( )
{
    
    // main_queue
    // Returns the serial dispatch queue associated with the application’s main thread
    
    // global_queue
    // Returns a system-defined global concurrent queue with the specified quality of service class
    
    
    // ======================== customize-source
    // Creates a new dispatch source to monitor low-level system objects and automatically submit a handler block to a dispatch queue in response to events
    dispatch_source_t source =
        dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    // Sets the event handler block for the given dispatch source
    dispatch_source_set_event_handler(source, ^{
        printf("source-customized\n");
    });
    // Resume the invocation of block objects on a dispatch object.
    dispatch_resume(source);
    
    
    // ======================== timer-source
    dispatch_source_t timer
        = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1ull * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        printf("source-timer\n");
        // Merges data into a dispatch source of type DISPATCH_SOURCE_TYPE_DATA_ADD or DISPATCH_SOURCE_TYPE_DATA_OR and
        // submits its event handler block to its target queue
        dispatch_source_merge_data(source, 1);
    });
    dispatch_resume(timer);
    
    // Executes blocks submitted to the main queue
    dispatch_main();
}




static void _performCallback(void *info __unused)
{
    printf("_performCallback\n");
}
static void _timerCallBack(CFRunLoopTimerRef timer __unused, void *info)
{
    // fire RunLoopSourceContext.performCallback
    CFRunLoopSourceSignal(info);
}
void testSourceWithCF( )
{
    // customize-source
    CFRunLoopSourceContext source_context;
    bzero(&source_context, sizeof(source_context));
    source_context.perform = _performCallback;
    //
    //kCFAllocatorDefault
    CFRunLoopSourceRef source = CFRunLoopSourceCreate(NULL, 0, &source_context);
    CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopCommonModes);
    
    
    // timer
    CFRunLoopTimerContext timer_context;
    bzero(&timer_context, sizeof(timer_context));
    timer_context.info = source;
    //
    CFRunLoopTimerRef timer = CFRunLoopTimerCreate(NULL, CFAbsoluteTimeGetCurrent(), 1, 0, 0, _timerCallBack, &timer_context);
    CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, kCFRunLoopCommonModes);
    
    
    CFRunLoopRun();
}




int main(int argc, char * argv[])
{
    @autoreleasepool {
        
        
        testSourceWithGCD();
        
        //testSourceWithCF();
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

