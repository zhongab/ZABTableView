//
//  ZABTableView.m
//  TableViewDemo
//
//  Created by aibing zhong on 2017/4/5.
//  Copyright © 2017年 aibing zhong. All rights reserved.
//

#import "ZABTableView.h"
#import "ZABTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"


@interface ZABTableView()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_models;
    NSArray<ZABRegisterCell *> *_cells;
    NSString *_lastCellIdentifier;

}
@end

@implementation ZABTableView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
        [self addSubview:self.tableView];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:self.frame style:style];
        [self addSubview:self.tableView];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        
    }
    return self;
    
}
- (void)reload{
    [self.tableView reloadData];
}
- (void)addModels:(NSArray *)models{
    if(!_models) {
        _models = [[NSMutableArray alloc] initWithObjects:[NSArray array],nil];
    }
    if(models){
        [_models removeAllObjects];
        [_models addObjectsFromArray:models];
    }
}
- (id)modelAtIndexPath:(NSIndexPath *)indexPath{
    if (_models.count > indexPath.section) {
        NSArray *array = _models[indexPath.section];
        return array.count > indexPath.row ? array[indexPath.row] : nil;
    }
    return nil;
}
- (NSArray *)arrayAtIndexPath:(NSIndexPath *)indexPath{
    if (_models.count > indexPath.section) {
        return _models[indexPath.section];
    }
    return nil;
}
- (void)registerCells:(NSArray<ZABRegisterCell *> *)cells{
    if (cells.count > 0) {
        _cells = cells;
        [cells enumerateObjectsUsingBlock:^(ZABRegisterCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            [self.tableView registerClass:obj.class forCellReuseIdentifier:obj.cellIdentifier];
            
        }];
    }
}
- (NSString *)findCellIdentifier:(NSIndexPath *)indexPath{
    __block NSString *cellIdentifier = nil;
    [_cells enumerateObjectsUsingBlock:^(ZABRegisterCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj.indexPath == indexPath) {
            cellIdentifier = obj.cellIdentifier;
            _lastCellIdentifier = obj.cellIdentifier;
            *stop = YES;
           
        }else{
            cellIdentifier = _lastCellIdentifier;
        }
    }];
    return cellIdentifier;
    
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _models.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)_models[section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZABTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self findCellIdentifier:indexPath]
                                                             forIndexPath:indexPath];
    id model = [self modelAtIndexPath:indexPath];
    
    [cell bindData:model indexPath:indexPath];
    [cell bindArray:[self arrayAtIndexPath:indexPath] indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if([self.delegate respondsToSelector:@selector(zabTableView:didSelectRowAtIndexPath:withModel:)]) {
        [self.delegate zabTableView:self didSelectRowAtIndexPath:indexPath withModel:[self modelAtIndexPath:indexPath]];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if([self.delegate respondsToSelector:@selector(zabTableView:heightForRowAtIndexPath:)]) {
        return [self.delegate zabTableView:self heightForRowAtIndexPath:indexPath];
    }else{
        
        CGFloat height = [tableView fd_heightForCellWithIdentifier:[self findCellIdentifier:indexPath] cacheByIndexPath:indexPath configuration:^(ZABTableViewCell *cell) {
            
            [cell bindData:[self modelAtIndexPath:indexPath] indexPath:indexPath];
            
        }];
        if (height < 45.0) height = 45.0;
        return height;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if([self.delegate respondsToSelector:@selector(zabTableView:heightForHeaderInSection:)]) {
       return [self.delegate zabTableView:self heightForHeaderInSection:section];
    }
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if ([self.delegate respondsToSelector:@selector(zabTableView:heightForFooterInSection:)]) {
        return [self.delegate zabTableView:self heightForFooterInSection:section];
    }
    return 0.1;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if ([self.delegate respondsToSelector:@selector(tableView:viewForFooterInSection:)]) {
        return [self.delegate tableView:self viewForFooterInSection:section];
    }
    return nil;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if ([self.delegate respondsToSelector:@selector(tableView:titleForHeaderInSection:)]) {
        return [self.delegate tableView:self titleForHeaderInSection:section];
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isSeparatorInsetZero) {
        if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        
        if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [tableView setLayoutMargins:UIEdgeInsetsZero];
        }
        
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }

    }
}
- (void)setIsShowSeparatorLine:(BOOL)isShowSeparatorLine{
    _isShowSeparatorLine = isShowSeparatorLine;
    if (!_isShowSeparatorLine) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
}


@end
