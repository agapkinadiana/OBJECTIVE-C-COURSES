//
//  DemoNSSortDescriptor.m
//  NSObject
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import "DemoNSSortDescriptor.h"
#import "Player.h"

@implementation DemoNSSortDescriptor
+ (void)sort {
    NSSortDescriptor *nickNameSort = [[NSSortDescriptor alloc] initWithKey:@"nickName" ascending:YES];
    NSSortDescriptor *scores = [[NSSortDescriptor alloc] initWithKey:@"scores" ascending:YES];


    NSArray *all = [DemoNSSortDescriptor allPlayers];
    NSArray *sortedNickName = [all sortedArrayUsingDescriptors:@[scores]];

}

+ (NSArray *)allPlayers{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    Player *player1 = [[Player alloc] initWithNickName:@"Red" realName:@"Bob" scores:@(40)];
    Player *player2 = [[Player alloc] initWithNickName:@"Redmi" realName:@"Sam" scores:@(49)];
    Player *player3 = [[Player alloc] initWithNickName:@"Albert" realName:@"Dave" scores:@(0)];
    Player *player4 = [[Player alloc] initWithNickName:@"Pool" realName:@"Release" scores:@(9)];
    Player *player5 = [[Player alloc] initWithNickName:@"MRC" realName:@"Jonny" scores:@(9)];

    [array addObject:player1];
    [array addObject:player2];
    [array addObject:player3];
    [array addObject:player4];
    [array addObject:player5];

    return array;
}

+(void)regularExspression {
    NSString *searchedString = @"domain-name.tld.tld2";
    NSRange   searchedRange = NSMakeRange(0, [searchedString length]);
    NSString *pattern = @"(?:www\\.)?((?!-)[a-zA-Z0-9-]{2,63}(?<!-))\\.?((?:[a-zA-Z0-9]{2,})?(?:\\.[a-zA-Z0-9]{2,})?)";
    NSError  *error = nil;

    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    NSTextCheckingResult *match = [regex firstMatchInString:searchedString options:0 range: searchedRange];
    NSLog(@"group1: %@", [searchedString substringWithRange:[match rangeAtIndex:1]]);
    NSLog(@"group2: %@", [searchedString substringWithRange:[match rangeAtIndex:2]]);
}
@end
