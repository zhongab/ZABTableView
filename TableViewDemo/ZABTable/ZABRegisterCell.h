//
//  ZABRegisterCell.h
//  TableViewDemo
//
//  Created by aibing zhong on 2017/4/6.
//  Copyright © 2017年 aibing zhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZABRegisterCell : NSObject
@property(nonatomic,strong)NSIndexPath *indexPath;
@property(nonatomic,strong)NSString *cellIdentifier;
@property(nonatomic,assign)Class class;

- (instancetype)initWithCellIdentifier:(NSString *)cellId class:(Class)class indexPath:(NSIndexPath *)indexPath;
@end
