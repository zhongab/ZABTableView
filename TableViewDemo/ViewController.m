//
//  ViewController.m
//  TableViewDemo
//
//  Created by aibing zhong on 2017/4/5.
//  Copyright © 2017年 aibing zhong. All rights reserved.
//

#import "ViewController.h"
#import "ZABTableView.h"
#import "PersonCellTableViewCell.h"
#import "Person.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *array = [NSMutableArray array];
    for (int i= 0; i < 20; i++) {
        Person *p = [Person new];
        p.name = @"索朗多吉发了多少积分累计失联飞机拉屎的风景老师的加夫里什积分累计啊失联飞机拉屎就疯了似的f";
        p.remark = @"索朗多吉发了多少积分累计失联飞机拉屎的风景老师的加夫里什积分累计啊失联飞机拉屎就疯了似的f";
        [array addObject:p];
    }
    
    Person *pNew1 = [Person new];
    pNew1.name = @"第二个section";
    pNew1.age = 55;
    
   
    ZABTableView *tableView = [[ZABTableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:tableView];
  
    
    
    [tableView addModels:@[array,@[pNew1]]];
    
    ZABRegisterCell *regiterCell = [[ZABRegisterCell alloc] initWithCellIdentifier:@"CellIdentifier"
                                                                             class:[PersonCellTableViewCell class]
                                                                         indexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [tableView registerCells:@[regiterCell]];
    tableView.isSeparatorInsetZero = YES;
    tableView.isShowSeparatorLine = NO;
    
    [tableView reload];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
