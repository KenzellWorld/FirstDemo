//
//  PSCourse.h
//  FirstDemo
//
//  Created by Steve on 2/13/14.
//  Copyright (c) 2014 Steve. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PSModel <NSObject>

-(void)refresh;
-(void)load;
-(void)save;

@end

@protocol PSCourseDelegate;


@interface PSCourse : NSObject<PSModel>
@property (nonatomic) id<PSCourseDelegate> delegate;
@property (nonatomic, strong) NSDecimalNumber* coursePrice;
@property (nonatomic, strong) NSString* courseDescription;
@property (nonatomic, strong) NSString* courseTitle;
@property (nonatomic, strong) NSDate* courseDate;
@property (nonatomic, strong) NSNumber* courseID;
+(PSCourse*)initFromDictionary:(NSDictionary*)dict;
-(void)internalAddDescription;
-(void)addCourseDescription:(NSString*)description;
-(void)addCourseDescription:(NSString *)description withDetails:(NSString *) details;
-(void)refresh;
@end

@protocol PSCourseDelegate <NSObject>

-(void)notifyDescriptionChanged:(PSCourse*)course;

@end
