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
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *array = [NSMutableArray array];
    for (int i= 0; i < 20; i++) {
        Person *p = [Person new];
        p.name = [NSString stringWithFormat:@"name%d",i];
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
