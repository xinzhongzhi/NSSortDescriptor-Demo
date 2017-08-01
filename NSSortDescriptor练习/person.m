//
//  person.m
//  NSSortDescriptor练习
//
//  Created by 辛忠志 on 2017/8/1.
//  Copyright © 2017年 辛忠志. All rights reserved.
//

#import "person.h"

@implementation person

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age score:(float)score
{
    if (self = [super init]) {
        
        self.name = name;
        self.age = age;
        self.score = score;
        
    }
    return self;
}

@end
