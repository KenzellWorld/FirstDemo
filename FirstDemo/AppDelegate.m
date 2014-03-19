//
//  AppDelegate.m
//  FirstDemo
//
//  Created by Steve on 2/11/14.
//  Copyright (c) 2014 Steve. All rights reserved.
//

#import "AppDelegate.h"
#import "PSCourse.h"
#import "PSCourseManager.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSDictionary* data;
    data = @{@"courseID":@"42",@"coursePrice":@"29.99",@"courseDate":@"04/1/2014"};
    NSArray* courses = @[data, [data copy], [data copy], [data copy]];
    NSMutableArray* objectCourses = [[NSMutableArray alloc] initWithCapacity:courses.count];
    for (NSDictionary* course in courses) {
        PSCourse* course2 = [PSCourse initFromDictionary:course];
        [objectCourses addObject:course2];
    }
    PSCourse* course2 = [PSCourse initFromDictionary:data];
    
    // bi-directional loosely coupled communication
    // much more common - all over UIKit and Foundation
    PSCourse* course = [[PSCourse alloc] init];
    NSInteger i = 42;
    course.courseID = [NSNumber numberWithInteger:i];
    course.courseDate = [NSDate date];
    course.coursePrice = [NSDecimalNumber decimalNumberWithString:@"29.99"];
    NSString* numberString = [course.courseID stringValue];
    NSString* decimalString = [NSString stringWithFormat:@"Course Id = %@", course.courseID];
    
    PSCourseManager* courseManager = [[PSCourseManager alloc]init];
    course.delegate = courseManager;
    [course addCourseDescription: @"force delegate" withDetails:@""];
    // abstract "interface" usage
    id<PSModel> model = (id <PSModel>)course;
    [model refresh];
    [model load];
    [model save];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
