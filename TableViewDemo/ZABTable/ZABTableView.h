//
//  ZABTableView.h
//  TableViewDemo
//
//  Created by aibing zhong on 2017/4/5.
//  Copyright © 2017年 aibing zhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZABRegisterCell.h"

@class ZABTableView;
@protocol ZABDataDelegate <NSObject>

@optional
- (void)zabTableView:(ZABTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
/*
 * 设置行高，如果不设置 会按实际内容自动计算高度
 */
- (CGFloat)zabTableView:(ZABTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)zabTableView:(ZABTableView *)tableView heightForHeaderInSection:(NSInteger)section;
- (CGFloat)zabTableView:(ZABTableView *)tableView heightForFooterInSection:(NSInteger)section;
- (UIView *)tableView:(ZABTableView *)tableView viewForFooterInSection:(NSInteger)section;
- (NSString *)tableView:(ZABTableView *)tableView titleForHeaderInSection:(NSInteger)section;

@end

@interface ZABTableView : UIView

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,weak)id<ZABDataDelegate> delegate;
@property(nonatomic,assign)BOOL isSeparatorInsetZero;//分割线是否到头
@property(nonatomic,assign)BOOL isShowSeparatorLine;//是否显示分割线


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;
- (instancetype)initWithFrame:(CGRect)frame;

- (void)addModels:(NSArray *)models;

- (id)modelAtIndexPath:(NSIndexPath *)indexPath;

- (void)registerCells:(NSArray<ZABRegisterCell *> *)cells;

- (void)reload;
@end
