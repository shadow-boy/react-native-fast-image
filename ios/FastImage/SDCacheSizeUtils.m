//
//  SDCacheSizeUtils.m
//  RNFastImage
//
//  Created by lianyou wang on 2023/3/4.
//

#import "SDCacheSizeUtils.h"
#import <SDWebImage/SDImageCache.h>

@implementation SDCacheSizeUtils


+(NSString * )getCurrentCacheSizeFormatStr{
    /// 获取缓存大小
     NSString * currentCacheSize = [NSString stringWithFormat:@"%@",[self fileSizeWithInteger:[[SDImageCache sharedImageCache] totalDiskSize]]];
    return currentCacheSize;

   
}

// 根据数据计算出大小
+ (NSString *) fileSizeWithInteger:(NSInteger)size{
    // 1K = 1024dB, 1M = 1024K,1G = 1024M
    if (size < 1024) {// 小于1k
        return [NSString stringWithFormat:@"%ldB",(long)size];
    }else if (size < 1024 * 1024){// 小于1m
        CGFloat aFloat = size/1024;
        return [NSString stringWithFormat:@"%.0fKB",aFloat];
    }else if (size < 1024 * 1024 * 1024){// 小于1G
        CGFloat aFloat = size/(1024 * 1024);
        return [NSString stringWithFormat:@"%.1fMB",aFloat];
    }else{
        CGFloat aFloat = size/(1024*1024*1024);
        return [NSString stringWithFormat:@"%.1fGB",aFloat];
    }
    
}

@end
