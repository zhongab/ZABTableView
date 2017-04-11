//
//  PersonCellTableViewCell.m
//  TableViewDemo
//
//  Created by aibing zhong on 2017/4/6.
//  Copyright © 2017年 aibing zhong. All rights reserved.
//

#import "PersonCellTableViewCell.h"
#import "Person.h"
#import "Masonry.h"
@implementation PersonCellTableViewCell

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
        
        
        [self setupMasonry];
    }
    return self;
    
}
- (void)setupMasonry{
    
    
    self.labelLeft = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.labelLeft];
    self.labelLeft.backgroundColor = [UIColor redColor];
    self.labelLeft.numberOfLines = 0;
    [self.labelLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(20);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20);
        make.top.mas_equalTo(self.contentView.mas_top);
    }];
    
    self.labelRight = [[UILabel alloc] initWithFrame:CGRectZero];
    self.labelRight.numberOfLines = 0;
    [self.contentView addSubview:self.labelRight];
    self.labelRight.backgroundColor = [UIColor blueColor];
    [self.labelRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.labelLeft.mas_left);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20);
        make.top.mas_equalTo(self.labelLeft.mas_bottom).offset(5);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-20);
        
    }];

}


- (void)bindData:(id)model indexPath:(NSIndexPath * )indexPath{
    [super bindData:model indexPath:indexPath];
    if ([model isKindOfClass:[Person class]]) {
        Person *p = (Person *)model;
        self.labelLeft.text = p.name;
        self.labelRight.text = p.remark;
    }
}



@end
