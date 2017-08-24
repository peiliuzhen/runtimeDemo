//
//  UIGestureRecognizer+Block.h
//  runtimeDemo
//
//  Created by plz on 2017/6/8.
//  Copyright © 2017年 com.bwsctv. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BWGestureBlcok) (id gestureRecognizer);

@interface UIGestureRecognizer (Block)

+(instancetype)bw_gestureRecognizerWithActionBlock:(BWGestureBlcok)block;

@end
