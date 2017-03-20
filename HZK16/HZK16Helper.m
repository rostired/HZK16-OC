//
//  HZK16Helper.m
//  HZK16
//
//  Created by Rostired on 17/3/20.
//  Copyright © 2017年 rostired. All rights reserved.
//

#import "HZK16Helper.h"

@implementation HZK16Helper

- (void)generateDotMatrix:(NSString *)word
{
    if (word.length != 1) {
        return;
    }
    
    NSStringEncoding encode = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    const char *chars = [word cStringUsingEncoding:encode];
    // 0xA0 = 160
    NSInteger areaCode = [[NSNumber numberWithUnsignedChar:chars[0]] integerValue] - 160;
    NSInteger posCode = [[NSNumber numberWithUnsignedChar:chars[1]] integerValue] - 160;
    NSInteger offset = (94 * (areaCode - 1) + (posCode - 1 )) * 32;
    NSString *filePath = @"Path for HZK16 file";
    NSInteger fileLength = [NSData dataWithContentsOfFile:filePath].length;
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    if (!handle || offset >= fileLength) {
        return;
    }
    [handle seekToFileOffset:offset];
    NSData *data = [handle readDataOfLength:32];
    [handle closeFile];
    char buffer[32];
    [data getBytes:buffer length:32];
    char key[8] = {
        0x80,0x40,0x20,0x10,0x08,0x04,0x02,0x01
    };
    for(NSInteger k = 0; k < 16; k++){
        for(NSInteger j = 0; j < 2; j++){
            for(NSInteger i = 0; i < 8; i++){
               BOOL flag = buffer[k * 2 + j] & key[i];
                printf("%s", flag?"⚫️":"⚪️");
            }
        }
        printf("\n");
    }

}

@end
