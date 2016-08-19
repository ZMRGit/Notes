//
//  OrderFillCell.m
//  HHY
//
//  Created by chenguangjiang on 14-11-7.
//  Copyright (c) 2014年 yunluosoft. All rights reserved.
//

#import "OrderFillCell.h"
#import "HotelOrderParameter.h"
@implementation OrderFillCell

- (void)awakeFromNib {
 
    
    self.invoice = @"0";
    self.noBut.selected = YES;
    self.isBut.selected = NO;
    self.postcode.delegate = self;
    self.adress.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hiddenKeyboard) name:@"hiddenkeyboard" object:nil];

    self.postcode.hidden = YES;
    self.adress.hidden = YES;
}
-(void)layoutSubviews
{
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"contact"])
    {
        self.Contacter.text = [[[NSUserDefaults standardUserDefaults] objectForKey:@"contact"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"tel"])
    {
        self.phoneNum.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"tel"];
    }
//    if([[NSUserDefaults standardUserDefaults] objectForKey:@"postCode"])
//    {
//        self.postcode.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"postCode"];
//    }
//    if([[NSUserDefaults standardUserDefaults] objectForKey:@"address"])
//    {
//        self.adress.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"address"];
//    }

    self.Contacter.delegate = _fillOrderVC;
    self.phoneNum.delegate = _fillOrderVC;
    self.postcode.delegate = _fillOrderVC;
    self.adress.delegate = _fillOrderVC;
}



- (IBAction)yes {
    if(!_isBut.selected)
    {
        _isBut.selected = YES;
        _noBut.selected = NO;
    }

    if(_isBut.selected)
    {
        self.invoice = @"1";
    }
    else
    {
        self.invoice = @"0";
    }
    
    self.postcode.hidden = NO;
    self.adress.hidden = NO;
    
}

- (IBAction)no {
    if(!_noBut.selected)
    {
        _noBut.selected = YES;
        _isBut.selected = NO;
    }

    if(_noBut.selected)
    {
        self.invoice = @"0";
    }
    else
    {
        self.invoice = @"1";
    }
    self.postcode.hidden = YES;
    self.adress.hidden = YES;
}

-(void)hiddenKeyboard{

    for(UITextField *textfield in self.contentView.subviews)
    {
        [textfield resignFirstResponder];
    }
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
  
    [textField resignFirstResponder];
    
       return YES;
 
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end