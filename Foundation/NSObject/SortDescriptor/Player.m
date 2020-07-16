//
//  Player.m
//  NSObject
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithNickName:(NSString *)nickName realName:(NSString *)realName scores:(NSNumber *)scores{
    self = [super init];
    if (self) {
        self.nickName = nickName;
        self.realName = realName;
        self.scores = scores;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Nickname: %@ Realname: %@ Scores:%@", self.nickName, self.realName, self.scores.stringValue];
}
@end
