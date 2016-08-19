//
//  OrderDetailViewController.m
//  HHY
//
//  Created by jiangjun on 14-4-30.
//  Copyright (c) 2014年 yunluosoft. All rights reserved.
//

#import "OrderDetailViewController.h"
#import "CustomView.h"
#import "PassengersCell.h"
#import "AirPlainInfoCell.h"
#import "OrderInfoCell.h"
#import "LinkPeopleCell.h"
#import "OrderDetailModel.h"
#import "PassengerDetailModel.h"
#import "FlightsDetailModel.h"
#import "ChangeDateSQViewController.h"
#import "AirReturnTicketSQViewController.h"
#import "TicketPayViewController.h"

@interface OrderDetailViewController ()<UITextFieldDelegate>
{
//    NSString *airLineName;
//    NSString *desCity;
//    NSString *flightNumber;
//    NSString *orgCity;
//    NSString *departTime;
    NSDictionary *DetailDic;
}

@end

@implementation OrderDetailViewController
@synthesize orderState = _orderState;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
 
    [self initNav:@"订单详情"];
    [self creatScreen];
    [self getLoadData];
}

-(void)createRighteItem
{
    UIButton *phoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    phoneButton.frame = CGRectMake(232, 0, 30, 44);
    [phoneButton setImage:[UIImage imageNamed:@"playPhone"]forState:UIControlStateNormal];
    [phoneButton addTarget:self action:@selector(playPhone) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *tempItem = [[UIBarButtonItem alloc] initWithCustomView:phoneButton];
    
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(276, 0, 30, 44);
    [rightButton setImage:[UIImage imageNamed:@"fhsy"]forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(returnRoot) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    UIBarButtonItem *flexright = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:NULL];
    [flexright setWidth:5];
    self.navigationItem.rightBarButtonItems = @[rightItem, flexright, tempItem];
}



-(void)creatScreen
{
    
    if (iPhone5) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 568-64-50) style:UITableViewStyleGrouped];
    }else{
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-64-50) style:UITableViewStyleGrouped];
    }

    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    UIView *view = [[UIView alloc] init];
   
    view.userInteractionEnabled = YES;
    view.backgroundColor = [JJDevice colorWithR:224 G:137 B:34 A:1];
    if (iPhone5) {
        view.frame = CGRectMake(0, 568-64-50, 320, 50);
    }else{
        view.frame = CGRectMake(0, 480-64-50, 320, 50);
    }
    [self.view addSubview:view];
    NSArray *array;
    if ([_orderState isEqualToString:@"0"]) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"支付"forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"tuiding"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"tuidingBTN"] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 2001;
        button.frame = CGRectMake(260, 5, 50, 40);
        [view addSubview:button];
    } else if([_orderState isEqualToString:@"9"]){
        array = @[@"退票", @"改期"];
        for (int i=0; i<2; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"tuiding"] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"tuidingBTN"] forState:UIControlStateHighlighted];
            [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 2000+i;
            button.frame = CGRectMake(200+i*60, 5, 50, 40);
            [view addSubview:button];
        }
    }
    
  
    UILabel *lable = [AffUIToolBar lableCgrectmake:CGRectMake(20, 10, 130, 30) lableNametext:[NSString stringWithFormat:@"订单总额: ¥%@", self.allCountPrice]];
    lable.textAlignment = NSTextAlignmentLeft;
    lable.textColor = [UIColor whiteColor];
    [view addSubview:lable];
    
    if(_isShenPi)
    {
        view.hidden = YES;
        if (iPhone5) {
            [_tableView setFrame:CGRectMake(0, 0, 320, 568-64)];;
        }else{
            [_tableView setFrame:CGRectMake(0, 0, 320, 480-64)];
        }
        
    }
    
}

-(void)btnClick:(UIButton *)button
{
    if (button.tag == 2000) {
        AirReturnTicketSQViewController *avc = [[AirReturnTicketSQViewController alloc] init];
        avc.dataModel = self.dataModel;
        avc.allCountPrice = self.allCountPrice;
        [self.navigationController pushViewController:avc animated:YES];
    }else if(button.tag == 2001){
        if ([_orderState isEqualToString:@"0"]) {

//            cell.typeLable.text = [NSString stringWithFormat:@"%@%@%@(%@) %@", model.ticketModel.airLineName, model.ticketModel.airLineCode, model.ticketModel.fltNo, model.ticketModel.planeModel, model.palceText];
    
            //跳支付
            TicketPayViewController *theView = [[TicketPayViewController alloc] init];
            theView.orderNum = _orderNum;
            theView.allCount = [self.allCountPrice integerValue];
            theView.detailInfo = DetailDic;
            [self.navigationController pushViewController:theView animated:YES];
            
        } else {
            ChangeDateSQViewController *chvc = [[ChangeDateSQViewController alloc] init];
            chvc.dataModel = self.dataModel;
            chvc.allCountPrice = self.allCountPrice;
            [self.navigationController pushViewController:chvc animated:YES];
        }
    }
}

-(void)getLoadData
{
    
    
    if(_isShenPi)
    {
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [[HHYNetworkEngine sharedInstance] queryCheckOrderDetail:self.orderNum username:self.username block:^(NSError *error, id data) {
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            if (!error) {
                
                DetailDic = [NSDictionary dictionaryWithDictionary:data];
                
                self.dataModel = [[OrderDetailModel alloc] init];
                if ([data isKindOfClass:[NSDictionary class]]) {
                    [self.dataModel jiexiFromDict:data];
                    if ([[data objectForKey:@"flightDetailVO"] isKindOfClass:[NSArray class]]) {
                        for (NSDictionary *dict in [data objectForKey:@"flightDetailVO"]) {
                            FlightsDetailModel *fmodel = [[FlightsDetailModel alloc] initWithDictionary:dict error:nil];
                            [self.dataModel addOneFlight:fmodel];
                        }
                    }
                    
                    if ([[data objectForKey:@"passengerDetailVO"] isKindOfClass:[NSArray class]]) {
                        for (NSDictionary *dict in [data objectForKey:@"passengerDetailVO"]) {
                            PassengerDetailModel *pmodel = [[PassengerDetailModel alloc] initWithDictionary:dict error:nil];
                            [self.dataModel addOnePassenger:pmodel];
                        }
                    }
                }
                [_tableView reloadData];
            }
        }];
        return;
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[HHYNetworkEngine sharedInstance] queryOrderDetail:self.orderNum block:^(NSError *error, id data) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        if (!error) {
       
            DetailDic = [NSDictionary dictionaryWithDictionary:data];
 
            self.dataModel = [[OrderDetailModel alloc] init];
            if ([data isKindOfClass:[NSDictionary class]]) {
                [self.dataModel jiexiFromDict:data];
                if ([[data objectForKey:@"flightDetailVO"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in [data objectForKey:@"flightDetailVO"]) {
                        FlightsDetailModel *fmodel = [[FlightsDetailModel alloc] initWithDictionary:dict error:nil];
                        [self.dataModel addOneFlight:fmodel];
                    }
                }
                
                if ([[data objectForKey:@"passengerDetailVO"] isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in [data objectForKey:@"passengerDetailVO"]) {
                        PassengerDetailModel *pmodel = [[PassengerDetailModel alloc] initWithDictionary:dict error:nil];
                        [self.dataModel addOnePassenger:pmodel];
                    }
                }
            }
            [_tableView reloadData];
        }
    }];
}

#pragma tableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return self.dataModel.flightArray.count;
    }else if (section == 2){
        return self.dataModel.passengerArray.count;
    }else{
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        OrderInfoCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"OrderInfoCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"OrderInfoCell" owner:self options:nil] lastObject];
        }
        cell.orderNum.text = self.dataModel.orderNumber;
        cell.bookTime.text = [[self.dataModel.addTime componentsSeparatedByString:@" "] objectAtIndex:0];
     
        cell.payType.text = [JJDevice payType:self.dataModel.payment];
        cell.orderState.text = [JJDevice orderState:self.orderState];
    
        return cell;
    }else if (indexPath.section == 1){
        AirPlainInfoCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"AirPlainInfoCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"AirPlainInfoCell" owner:self options:nil] lastObject];
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        FlightsDetailModel *model = [self.dataModel.flightArray objectAtIndex:indexPath.row];
        cell.dateLable.text = [[model.departureDate componentsSeparatedByString:@" "] objectAtIndex:0];
        cell.placeLable.text = [NSString stringWithFormat:@"%@-%@", model.orgCityCN, model.desCityCN];
        cell.startDate.text = model.departureTime;
        NSArray *array = [model.terminal componentsSeparatedByString:@"--"];
        cell.startPlace.text = [NSString stringWithFormat:@"%@%@", model.orgCity, [array objectAtIndex:0]];
        cell.endTime.text = model.arrivalTime;
        if(array.count > 1)
        {
            cell.endPlace.text = [NSString stringWithFormat:@"%@%@", model.desCity, [array objectAtIndex:1]];
        }
        cell.jixingType.text = [NSString stringWithFormat:@"%@       %@    %@    机型%@", model.airWayName, model.flightnumber, [JJDevice shipType:model.cabin], model.model];
        cell.priceLable.text = [NSString stringWithFormat:@"¥%@", model.ticketPrice];
        cell.suiPrice.text = [NSString stringWithFormat:@"¥%@", model.tax];
        return cell;
    }else if (indexPath.section == 2){
        PassengersCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"PassengersCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"PassengersCell" owner:self options:nil] lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        PassengerDetailModel *model = [self.dataModel.passengerArray objectAtIndex:indexPath.row];
        cell.namelable.text = model.name;
        cell.identNum.text = model.idNo;
        
    
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"航空意外保险  %d份  共%@元", [model.insurance intValue]/20, model.insurance]];
        NSString *tempStr = [NSString stringWithFormat:@"航空意外保险  %d份  共", [model.insurance intValue]/20];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(tempStr.length, str.length-tempStr.length-1)];
        cell.baoxianLable.attributedText = str;
        return cell;
    }else{
        LinkPeopleCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"LinkPeopleCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"LinkPeopleCell" owner:self options:nil] lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.nameTF.text = self.dataModel.contactName;
        cell.phoneTF.text = self.dataModel.mobile;
        cell.emainTF.text = self.dataModel.email;
        cell.nameTF.delegate = self;
        cell.phoneTF.delegate = self;
        cell.emainTF.delegate = self;
        
        return cell;
    }
}
#pragma tableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 50.0f;
    }else if (indexPath.section==1) {
        return 150.0f;
    }else if (indexPath.section==2) {
        return 90.0f;
    }else if (indexPath.section==3) {
        return 90.0f;
    }else
        return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    NSArray *array = @[@"订单信息", @"航班信息", @"乘机人信息", @"联系人信息"];
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 300, 20)];
    lable.text = [array objectAtIndex:section];
    [view addSubview:lable];
    lable.font = FONT_15;
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}



-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
