//
//  AirPlainSelectedCell.h
//  HHY
//
//  Created by jiangjun on 14-6-5.
//  Copyright (c) 2014年 yunluosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AirPlainSelectedCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *startDate;
@property (weak, nonatomic) IBOutlet UILabel *placeLable;
@property (weak, nonatomic) IBOutlet UILabel *jipiaojia;
@property (weak, nonatomic) IBOutlet UILabel *jipiaoPlace;
@property (weak, nonatomic) IBOutlet UILabel *suifei;
@property (weak, nonatomic) IBOutlet UILabel *suiPlace;
@property (weak, nonatomic) IBOutlet UIButton *cellSelect;
@property (weak, nonatomic) IBOutlet UIButton *tuiGaiGuiDing;
@property (nonatomic,assign)BOOL isSelected;
@end
