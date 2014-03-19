//
//  PSCourse.m
//  FirstDemo
//
//  Created by Steve on 2/13/14.
//  Copyright (c) 2014 Steve. All rights reserved.
//

#import "PSCourse.h"

@implementation PSCourse
NSString* _courseDescription;
+(PSCourse*) initFromDictionary:(NSDictionary *)dict{
    static NSString* courseIDKey = @"courseID";
    static NSString* courseDateKey = @"courseDate";
    static NSString* coursePriceKey = @"coursePrice";
    PSCourse* newPSCourse = [[PSCourse alloc] init];
    NSString* courseID = dict[courseIDKey];
    NSString* courseDate = dict[courseDateKey];
    NSString* coursePrice = dict[coursePriceKey];
    
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
    newPSCourse.courseID = [formatter numberFromString:courseID];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    newPSCourse.courseDate = [dateFormatter dateFromString:courseDate];
    newPSCourse.coursePrice = [NSDecimalNumber decimalNumberWithString:coursePrice];
    
    return newPSCourse;
}
-(void) internalAddDescription{
    
}
-(void) addCourseDescription:(NSString *)description{
    
}
-(void) addCourseDescription:(NSString *)description withDetails: (NSString *) details{
    _courseDescription = description;
    [self internalAddDescription];
    [self.delegate notifyDescriptionChanged:self];
}
#pragma mark PSModel protocol
-(void) refresh {
    
}
-(void)load {}
-(void)save{}
@end
