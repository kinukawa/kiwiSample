//
//  SampleSpec.m
//  KiwiSample
//
//  Created by kenji.kinukawa on 2014/04/01.
//  Copyright (c) 2014年 mixi. All rights reserved.
//

#import "Kiwi.h"

SPEC_BEGIN(MathSpec)

describe(@"Math", ^{
    it(@"is pretty cool", ^{
        NSUInteger a = 16;
        NSUInteger b = 26;
        [[theValue(a + b) should] equal:theValue(42)];
    });
});
SPEC_END

SPEC_BEGIN(HogeSpec)
describe(@"Math", ^{
    it(@"is pretty cool", ^{
        NSUInteger a = 16;
        NSUInteger b = 26;
        [[theValue(a + b) should] equal:theValue(42)];
    });
});
SPEC_END

SPEC_BEGIN(AsyncTest)
context(@"Fetching service data", ^{
    it(@"should receive data within one second", ^{
        NSURL *url = [NSURL URLWithString:@"http://mixi.jp"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];

        __block NSString *fetchedData = nil;
        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (error) {
                                                    return;
                                                }
                                                fetchedData = [[NSString alloc] initWithData:data encoding:NSJapaneseEUCStringEncoding];
                                            }];
        [task resume];

        [[expectFutureValue(fetchedData) shouldEventually] beNonNil];
        
    });
    
});

SPEC_END