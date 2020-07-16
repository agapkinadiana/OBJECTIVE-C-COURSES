//
//  Player.h
//  NSObject
//
//  Created by Yauheni Bararanouski on 3/3/20.
//  Copyright © 2020 Yauheni Bararanouski. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject
@property (nonatomic, copy) NSString *nickName;
@property (nonatomic, copy) NSString *realName;
@property (nonatomic, strong) NSNumber *scores;

- (instancetype)initWithNickName:(NSString *)nickName realName:(NSString *)realName scores:(NSNumber *)scores;
@end

NS_ASSUME_NONNULL_END
