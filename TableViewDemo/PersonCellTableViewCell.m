//
//  PersonCellTableViewCell.m
//  TableViewDemo
//
//  Created by aibing zhong on 2017/4/6.
//  Copyright © 2017年 aibing zhong. All rights reserved.
//

#import "PersonCellTableViewCell.h"
#import "Person.h"
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
        
        self.labelLeft = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, self.frame.size.height)];
        [self.contentView addSubview:self.labelLeft];
        //self.labelLeft.backgroundColor = [UIColor redColor];
        
        
        self.labelRight = [[UILabel alloc] initWithFrame:CGRectMake(150, 0, self.frame.size.width - 150, self.frame.size.height)];
        [self.contentView addSubview:self.labelRight];
        //self.labelRight.backgroundColor = [UIColor blueColor];
        
        
        
    }
    return self;
    
}
- (void)bindData:(id)model indexPath:(NSIndexPath * )indexPath{
    if ([model isKindOfClass:[Person class]]) {
        Person *p = (Person *)model;
        self.labelLeft.text = p.name;
        self.labelRight.text = [NSString stringWithFormat:@"%zd",p.age];
    }
}



@end
