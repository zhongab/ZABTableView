//
//  ZABRegisterCell.m
//  TableViewDemo
//
//  Created by aibing zhong on 2017/4/6.
//  Copyright © 2017年 aibing zhong. All rights reserved.
//

#import "ZABRegisterCell.h"

@implementation ZABRegisterCell
- (instancetype)initWithCellIdentifier:(NSString *)cellId class:(Class)class indexPath:(NSIndexPath *)indexPath{
    self = [super init];
    if (self) {
        self.cellIdentifier = cellId;
        self.class = class;
        self.indexPath = indexPath;
    }
    return self;
}
@end
