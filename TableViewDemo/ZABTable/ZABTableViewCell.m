//
//  ZABTableViewCell.m
//  TableViewDemo
//
//  Created by aibing zhong on 2017/4/5.
//  Copyright © 2017年 aibing zhong. All rights reserved.
//

#import "ZABTableViewCell.h"

@implementation ZABTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
- (void)bindData:(id)model indexPath:(NSIndexPath * )indexPath{
    
}
@end
