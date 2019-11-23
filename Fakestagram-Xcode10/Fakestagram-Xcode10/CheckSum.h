//
//  CheckSum.h
//  Fakestagram-Xcode10
//
//  Created by Pedro Carlos Monzalvo Navarro on 23/11/19.
//  Copyright © 2019 unam. All rights reserved.
//

#ifndef CheckSum_h
#define CheckSum_h
#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>

@interface CheckSum : NSObject
+(NSString *) sha256String: (NSString *)input;
@end

#endif /* Checksum_h */
