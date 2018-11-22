//
//  NSString+Hash.m
//  Hash
//
//  Created by 684lhz on 2018/11/19.
//  Copyright © 2018年 684lhz. All rights reserved.
//

#import "NSString+Hash.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (Hash)

/** md5 32位小写 */
- (NSString *)md5String {
    //转为char 指针
    const char * str = self.UTF8String;
    //结果保存位置
    uint8_t buffer[CC_MD5_DIGEST_LENGTH];
    
    //地址  长度  结果保存位置
    CC_MD5(str, (CC_LONG)strlen(str), buffer);
    
    NSMutableString * mutStr = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i ++) {
        //%02x     格式控制: 以十六进制输出,2为指定的输出字段的宽度.如果位数小于2,则左端补0
        //x小写 结果为小写  X大写 结果为大写
        [mutStr appendFormat:@"%02x", buffer[i]];
    }
    return mutStr;
}

/** sha1 32位 小写 */
- (NSString *)sha1String {
    const char * str = self.UTF8String;
    NSData * data = [NSData dataWithBytes:str length:self.length];
    
    uint8_t result[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, result);
    
    NSMutableString * resultStr = [NSMutableString string];
    for (int i = 0; i< CC_SHA1_DIGEST_LENGTH; i ++) {
        [resultStr appendFormat:@"%02x", result[i] ];
    }
    
    return resultStr;
}


@end
