//
//  ZABTableViewCell.h
//  TableViewDemo
//
//  Created by aibing zhong on 2017/4/5.
//  Copyright © 2017年 aibing zhong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZABTableViewCell : UITableViewCell


- (void)bindData:(id)model indexPath:(NSIndexPath * )indexPath;
- (void)bindArray:(NSArray *)datas indexPath:(NSIndexPath * )indexPath;

@end
