//
//  CheckSum.m
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 23/11/19.
//  Copyright © 2019 unam. All rights reserved.
//

#import "CheckSum.h"

@implementation CheckSum
- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

+(NSString *) sha256String: (NSString *)input{
    const char* str = [input UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA256_DIGEST_LENGTH; i++)
    {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

@end
