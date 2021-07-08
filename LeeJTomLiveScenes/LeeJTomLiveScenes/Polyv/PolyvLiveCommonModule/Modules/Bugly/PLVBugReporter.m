//
//  PLVBugReporter.m
//  PolyvLiveScenesDemo
//
//  Created by MissYasiky on 2020/12/25.
//  Copyright © 2020 polyv. All rights reserved.
//

#import "PLVBugReporter.h"
#import <PLVLiveScenesSDK/PLVLiveVideoConfig.h>
#import <Bugly/Bugly.h>

@interface PLVBugReporter ()

@property (class, nonatomic, assign) BOOL on;

@end

@implementation PLVBugReporter

#pragma mark - Class Property

static BOOL _on = NO;

+ (BOOL)on {
  return _on;
}

+ (void)setOn:(BOOL)on {
    _on = on;
}

#pragma mark - Public

+ (void)open {
    self.on = YES;
    [self setupBugly];
}

+ (void)setUserIdentifier:(NSString *)userId {
    if (self.on == NO) {
        return;
    }
    
    [Bugly setUserIdentifier:userId];
}

#pragma mark - Private

+ (void)setupBugly {
    if (![self isInnerTest]) {
        return;
    }
    BuglyConfig *config = [[BuglyConfig alloc] init];
    config.version = [PLVLiveVideoConfig playerVersion];
    
    [Bugly startWithAppId:@"f365e2034d" config:config];
}

+ (BOOL)isInnerTest {
    NSString* bundleID = [[NSBundle mainBundle] bundleIdentifier];
    return ([bundleID hasPrefix:@"polyv.PolyvLiveScenesDemo"]);
}

@end
