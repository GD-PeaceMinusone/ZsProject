//
//  XMGMeCell.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/12.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGMeCell.h"

@implementation XMGMeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    return self;
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    if (self.imageView.image == nil)  return;
    self.imageView.xmg_y = XMGSmallMargin;
    self.imageView.xmg_height = self.contentView.xmg_height - 2*XMGSmallMargin;
    self.imageView.xmg_x = XMGSmallMargin + 5;
    self.textLabel.xmg_x = self.imageView.xmg_right + XMGSmallMargin;
}
@end
