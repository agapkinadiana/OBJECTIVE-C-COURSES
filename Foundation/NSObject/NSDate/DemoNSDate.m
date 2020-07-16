//
//  DemoNSDate.m
//  NSObject
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import "DemoNSDate.h"

@implementation DemoNSDate

+ (NSString *)dateString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateStyle = NSDateIntervalFormatterMediumStyle;
    formatter.timeStyle = NSDateIntervalFormatterShortStyle;

    NSDate *date = [NSDate date];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (NSString *)dateStringCustomFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"EEEE, h a";
    //hi, fr_FR
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"fr_FR"];

    NSDate *date = [NSDate date];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (NSDate *)dateFromString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";

    NSString *dateString = @"2020-03-01";
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}
@end
