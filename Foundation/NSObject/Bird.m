//
//  Bird.m
//  NSObject
//
//  Created by Yauheni Bararanouski on 2/29/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import "Bird.h"

@implementation Bird

-(void)string {
    NSMutableString *string; // assume we have this
    // Remove prefix string:
    NSString *prefix = @"WeDon’tWantThisPrefix";
    NSRange r = [string rangeOfString:prefix options:NSAnchoredSearch range:NSMakeRange(0, string.length) locale:nil];
    if (r.location != NSNotFound) {
        [string deleteCharactersInRange:r];
    }
}

//Replacing Substrings

//-deleteCharactersInRange:
//-insertString:atIndex:
//-replaceCharactersInRange:withString:
//-replaceOccurrencesOfString:withString:options:range:

//-stringByReplacingOccurrencesOfString:withString:
//-stringByReplacingOccurrencesOfString:withString:options:range:
//-stringByReplacingCharactersInRange:withString:

-(void)multiline {
    NSString *limerick = @"A lively young damsel named Menzies\n"
    @"Inquired: «Do you know what this thenzies?»\n"
    @"Her aunt, with a gasp,\n"
    @"Replied: It's a wasp,\n"
    @"And you're holding the end where the stenzies.\n";

    NSString *limerick2 = @"A lively young damsel named Menzies\nInquired: «Do you know what this thenzies?»\nHer aunt, with a gasp,\nReplied: It's a wasp,\nAnd you're holding the end where the stenzies.\n";

    NSString *limerick3 = @"The man " @"who knows everything " @"learns nothing" @".";
}





//NSDate
//https://www.maddysoft.com/articles/dates.html


@end
