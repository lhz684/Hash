//
//  ViewController.m
//  Hash
//
//  Created by 684lhz on 2018/11/19.
//  Copyright © 2018年 684lhz. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Hash.h"
#import "SSKeychain.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * str = @"123456";
    NSLog(@"origin: %@", str);
    NSLog(@"md5: %@", str.md5String);
    
    
    
    //------------ sha1 加密 ---------
    NSLog(@"sha1: %@", str.sha1String);
    
    //-------------- MD5 加盐 --------------
    str = [str stringByAppendingString:@"dskjfanjdflabljjbeqjejnj{}afdnfafnkandfadc"];
    NSLog(@"origin 加盐: %@", str);
    NSLog(@"md5 加盐: %@", str.md5String);
    
    //-------------- HMAC ------------- key:密钥，一般从服务器获取
     /* 给定一个密钥，对明文进行加密，并且做了多次散列，得到32位字符 */
    
    /*-------------- 钥匙串访问 ----------
        1、苹果的生态圈，从7.0.3，开放给开发者
        2、钥匙串加密方式AES加密。 可以将保存的密码以明文方式反算回。
        3、苹果原始接口都是C语言的。第三方库SSKeyChain
     */
    
    //保存密码
    NSString * account = @"number123";
    NSString * pwd = @"asdfgh";
    NSString * boundleID = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    [SSKeychain setPassword:pwd forService:boundleID account:account];
    
    //获取密码
    NSString * readPwd = [SSKeychain passwordForService:boundleID account:account];
    NSLog(@"readPwd: %@", readPwd);
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
