//
//  NSString+Hash.h
//  Hash
//
//  Created by 684lhz on 2018/11/19.
//  Copyright © 2018年 684lhz. All rights reserved.
//

/*
 hash（散列函数），把任意长度的输入通过散列算法变换成固定长度的输出，输出的值为散列值。这种转换是一种压缩映射。
 将任意长度的消息压缩到固定长度的消息摘要函数。
 */

#import <Foundation/Foundation.h>

@interface NSString (Hash)

/** md5 32位小写 */
- (NSString *)md5String;

/** sha1 32位 小写 */
- (NSString *)sha1String;

@end
