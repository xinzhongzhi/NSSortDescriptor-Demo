//
//  person.h
//  NSSortDescriptor练习
//
//  Created by 辛忠志 on 2017/8/1.
//  Copyright © 2017年 辛忠志. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface person : NSObject

@property(nonatomic,strong)NSString *name;

@property(nonatomic,assign)NSInteger age;

@property(nonatomic,assign)float  score;

- (instancetype)initWithName:(NSString*)name age:(NSInteger)age score:(float)score;
@end
