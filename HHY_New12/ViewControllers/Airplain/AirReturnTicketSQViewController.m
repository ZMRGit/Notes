//
//  AirReturnTicketSQViewController.m
//  HHY
//
//  Created by jiangjun on 14-6-5.
//  Copyright (c) 2014年 yunluosoft. All rights reserved.
//

#import "AirReturnTicketSQViewController.h"
#import "FootView.h"
#import "GaiQiOrderCell.h"
#import "AirPlainSelectedCell.h"
#import "PassengerSelectCell.h"
#import "OrderDetailModel.h"
#import "PassengerDetailModel.h"
#import "FlightsDetailModel.h"

@interface AirReturnTicketSQViewController ()
{
    UIView *_ExitView;
}
@end

@implementation AirReturnTicketSQViewController

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
    self.edgesForExtendedLayout = UIRectEdgeNone;    [self initNav:@"退票申请"];
    [self createScreen];
    [self createFootView];
    [self loadData];
}
-(void)loadData
{
    if(self.orderNum)
    {
        if(!self.dataModel)
        {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            [[HHYNetworkEngine sharedInstance] queryOrderDetail:self.orderNum block:^(NSError *error, id data) {
                [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                if (!error) {
                    
                    
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
    }
}
-(void)createScreen
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (iPhone5) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -10, 320, 568-64) style:UITableViewStyleGrouped];
    }else{
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -10, 320, 480-64) style:UITableViewStyleGrouped];
    }
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddentextView)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:tap];
}

-(void)createFootView
{
    _footView = [[FootView alloc] initWithFrame:CGRectMake(0, 0, 320, 160)];
    [_footView.button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    _footView.textView.delegate = self;
    _footView.lable1.text = @"退票原因";
    [_footView.button setTitle:@"提交退票申请" forState:UIControlStateNormal];
    _tableView.tableFooterView = _footView;
}
#pragma tableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return self.dataModel.flightArray.count;
    }else if (section == 2){
        return self.dataModel.passengerArray.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        GaiQiOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GaiQiOrderCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"GaiQiOrderCell" owner:self options:nil] lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.orderNum.text = self.dataModel.orderNumber;
        cell.priceLable.text = [NSString stringWithFormat:@"¥ %@", self.allCountPrice];
        return cell;
    }else if (indexPath.section ==1){
        AirPlainSelectedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AirPlainSelectedCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"AirPlainSelectedCell" owner:self options:nil] lastObject];
            [cell.cellSelect setBackgroundImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateNormal];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        FlightsDetailModel *model = [self.dataModel.flightArray objectAtIndex:indexPath.row];
//        2014-04-15 周四 国航CA1831  头等舱
//        目前缺星期几
        cell.startDate.text = [NSString stringWithFormat:@"%@  %@%@  %@", [[model.departureTime componentsSeparatedByString:@" "] objectAtIndex:0], model.airWayName, model.flightnumber, [JJDevice shipType:model.cabin]];
        [cell.tuiGaiGuiDing addTarget:self action:@selector(showExitNotice) forControlEvents:UIControlEventTouchUpInside];
        cell.placeLable.text = [NSString stringWithFormat:@"%@ %@  --  %@ %@", model.orgCityCN, model.departureTime, model.desCityCN, model.arrivalTime];
        cell.jipiaoPlace.text = [NSString stringWithFormat:@"¥ %d", model.ticketPrice.intValue];
        cell.suiPlace.text = [NSString stringWithFormat:@"¥ %@", model.tax];
        [cell.cellSelect addTarget:self action:@selector(selectFligth:) forControlEvents:UIControlEventTouchUpInside];
        cell.cellSelect.tag = 1000+indexPath.row;
        return cell;
    }else {
        PassengerSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PassengerSelectCell"];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"PassengerSelectCell" owner:self options:nil] lastObject];
            [cell.cellSelect setBackgroundImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateNormal];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        PassengerDetailModel *model = [self.dataModel.passengerArray objectAtIndex:indexPath.row];
        cell.nameLable.text = model.name;
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"航空意外保险  %d份  共%@元", [model.insurance intValue]/20, model.insurance]];
        NSString *tempStr = [NSString stringWithFormat:@"航空意外保险  %d份  共", [model.insurance intValue]/20];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(tempStr.length, str.length-tempStr.length-1)];
        cell.pricelable.attributedText = str;
        [cell.cellSelect addTarget:self action:@selector(selectPassenger:) forControlEvents:UIControlEventTouchUpInside];
        cell.cellSelect.tag = 2000+indexPath.row;
        return cell;
    }
}

#pragma tableViewDelegate
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSArray *array = @[@"", @"航班信息", @"乘机人信息"];
    if (section) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 300, 20)];
        lable.text = [array objectAtIndex:section];
        lable.font = FONT_14;
        [view addSubview:lable];
        return view;
    }else
        return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section) {
        return 20.0f;
    }else
        return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 35.0f;
    }else if (indexPath.section == 1){
        return 110.0f;
    }else if (indexPath.section == 2){
        return 50.0f;
    }else
        return 0;
}

#pragma mark -- TextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([@"\n" isEqualToString:text] == YES)
    {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if(kScreenHeight < 568)
    {
        _tableView.contentOffset = CGPointMake(0, 240);
    }
    else
    {
        _tableView.contentOffset = CGPointMake(0, 150);
    }
    return YES;
}

-(void)selectFligth:(UIButton *)button
{
    FlightsDetailModel *model = [self.dataModel.flightArray objectAtIndex:button.tag-1000];
    if ([model getStateValue]) {
        [button setBackgroundImage:[UIImage imageNamed:@"normal.png"] forState:UIControlStateNormal];
        [model setStateValue:NO];
    }else{
        [model setStateValue:YES];
        [button setBackgroundImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateNormal];
    }
}

-(void)selectPassenger:(UIButton *)button
{
    PassengerDetailModel *model = [self.dataModel.passengerArray objectAtIndex:button.tag-2000];
    if ([model getStateValue]) {
        [button setBackgroundImage:[UIImage imageNamed:@"normal.png"] forState:UIControlStateNormal];
        [model setStateValue:NO];
    }else{
        [model setStateValue:YES];
        [button setBackgroundImage:[UIImage imageNamed:@"selected"] forState:UIControlStateNormal];
    }
}

-(void)btnClick
{
    if([self.footView.textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0)
    {
    UIAlertView *atl = [[UIAlertView alloc]initWithTitle:nil message:@"请填写改期原因" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [atl show];
    return;
    }
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:self.dataModel.orderNumber forKey:@"orderNo"];
    [dict setValue:self.dataModel.ticketState forKey:@"sid"];
    [dict setValue:self.footView.textView.text forKey:@"reason"];
    [dict setValue:@"" forKey:@"description"];
    [dict setValue:self.dataModel.email forKey:@"temail"];
    NSMutableString *passengerStr = [[NSMutableString alloc] init];
    for (PassengerDetailModel *model in self.dataModel.passengerArray) {
        if ([model getStateValue]) {
            [passengerStr appendString:model.sn];
            [passengerStr appendString:@"*"];
        }
    }
    
    if ([passengerStr length]==0) {
        //未选中乘机人--暂时默认选第一个
        PassengerDetailModel *model = [self.dataModel.passengerArray objectAtIndex:0];
        [passengerStr appendString:model.sn];
    }
    
    [dict setValue:[passengerStr substringToIndex:passengerStr.length-1] forKey:@"passenger"];
    
    NSMutableString *flightStr = [[NSMutableString alloc] init];
    for (FlightsDetailModel *model in self.dataModel.flightArray) {
        if ([model getStateValue]) {
            [flightStr appendString:model.sn];
            [flightStr appendString:@"*"];
        }
    }
    
    if ([flightStr length]==0) {
        //未选中改期机票
        FlightsDetailModel *model = [self.dataModel.flightArray objectAtIndex:0];
        [flightStr appendString:model.sn];
    }
    
    [dict setValue:[flightStr substringToIndex:flightStr.length-1] forKey:@"route"];
    
   
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[HHYNetworkEngine sharedInstance] orderChange:dict block:^(NSError *error, id data) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if (!error) {
     
            
            if ([data isEqualToString:@"成功"]) {
                UIAlertView *altView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"提交申请成功，请等待审核结果！" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [altView show];
            } else {
                UIAlertView *altView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"申请失败，请稍候再试！" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [altView show];
            }
        } else {
            UIAlertView *altView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"申请失败，请稍候再试！" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [altView show];
        }
    }];
}

-(void)showExitNotice:(NSString *)exitNotice
{
    if(_ExitView == nil)
    {
        CGSize size = [exitNotice sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:CGSizeMake(200, 1000)];
        _ExitView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, kScreenHeight)];
        _ExitView.backgroundColor = [UIColor clearColor];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, kScreenHeight)];
        imageView.backgroundColor = [UIColor blackColor];
        imageView.alpha = 0.5;
        [_ExitView addSubview:imageView];
        
        UIView *showView =  [[UIView alloc]initWithFrame:CGRectMake(25, (kScreenHeight - 250)/2, 270, 250)];
        showView.backgroundColor =[UIColor whiteColor];
        UIScrollView *scrolView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, showView.frame.size.width, showView.frame.size.height)];
        UILabel *checklabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 40, 30)];
        
        checklabel.textColor = kADWColor(215, 118, 27, 1);
        checklabel.text = @"改期:";
        checklabel.font = [UIFont systemFontOfSize:13];
        [scrolView addSubview:checklabel];
        
        
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)hiddentextView
{
    [_footView.textView resignFirstResponder];
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
