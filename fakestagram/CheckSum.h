//
//  CheckSum.h
//  fakestagram
//
//  Created by LuisE on 11/9/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

#ifndef CheckSum_h
#define CheckSum_h
#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>

@interface CheckSum : NSObject
+(NSString *) sha256String: (NSString *)input;
@end

#endif /* Checksum_h */
