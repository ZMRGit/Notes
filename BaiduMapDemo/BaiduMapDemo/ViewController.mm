//
//  ViewController.m
//  BaiduMapDemo
//
//  Created by chenguangjiang on 14-10-25.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import "BMKMapView.h"
#import "BMKLocationService.h"
@interface ViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate
>
{
    BMKMapView *_mapView;
    BMKLocationService *_locService;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    _mapView.zoomLevel = 17;
    _mapView.showsUserLocation = YES;
    [_mapView setMapType:BMKMapTypeStandard];//标准地图
    self.view  = _mapView;
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    [_locService startUserLocationService];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

//处理方向变更信息
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    //    NSLog(@"heading is %@",userLocation.heading);
}
//处理位置坐标更新
- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation
{
    //    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
