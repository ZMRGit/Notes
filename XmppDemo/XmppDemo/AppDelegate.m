//
//  AppDelegate.m
//  XmppDemo
//
//  Created by chenguangjiang on 14-7-15.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
{
    XMPPReconnect *_xmppReconnect;
    XMPPvCardCoreDataStorage *_xmppvCardCoreDataStorage;
    NSString *_jid;
    NSFetchedResultsController *_fetchedResultsController;
    
    
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    [self disConnect];
     [self teardownStream];
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [self connect];
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
//设置XMPPStream
-(void)setupStream
{
//    NSAssert(_xmppStream == nil, @"XMPPStream被多次初始化");

    
    if(_xmppStream == nil)
    {
        _xmppStream = [[XMPPStream alloc]init];
        //添加代理 因为所有网络请求都是基于网络的数据处理，跟界面无关，可以让代理从其它线程中进行
        
        //扩展模块
        
        //重新连接模块
        _xmppReconnect = [[XMPPReconnect alloc]init];
        
        
        //将重新连接模块添加到XMPPStream
        [_xmppReconnect activate:_xmppStream];
        
        
        //电子名片模块
        _xmppvCardCoreDataStorage = [XMPPvCardCoreDataStorage sharedInstance];
        _xmppvCardTempModule = [[XMPPvCardTempModule alloc]initWithvCardStorage:_xmppvCardCoreDataStorage];
        [_xmppvCardTempModule activate:_xmppStream];
        
        //花名册模块
        _xmppRosterCoreDataStorage = [[XMPPRosterCoreDataStorage alloc]init];
        _xmppRoster = [[XMPPRoster alloc]initWithRosterStorage:_xmppRosterCoreDataStorage];
        [_xmppRoster activate:_xmppStream];
        //设置自动接收好友订阅请求
        [_xmppRoster setAutoAcceptKnownPresenceSubscriptionRequests:YES];
        //自动从服务器更新好友记录，例如好友自己更改了名片
        [_xmppRoster setAutoFetchRoster:YES];
        
        
        [_xmppStream addDelegate:self  delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
        [_xmppRoster addDelegate:self delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    }


}

//通知服务器用户上线
-(void)goOnline
{
    //初始化一个“展现”，上线报告
    XMPPPresence *presence = [XMPPPresence presence];
    //发送presence给服务器 服务器知道“我”上线后，只需要通知我的好友。而无需通知我 ，因此，吃方法没回调
    
    [_xmppStream sendElement:presence];
}
//通知用户下线
-(void)goOfline
{
    
    XMPPPresence *prensece = [XMPPPresence presenceWithType:@"unavailable"];
    [_xmppStream sendElement:prensece];
    NSLog(@"用户下线");
}
//连接
-(void)connect
{
    
    if([_xmppStream isConnected])
    {
        [_xmppStream disconnect];
    }
    //1. 设置XMPPStream
    [self setupStream];
    
    //2. 指定用户名、主机、password另有代理方法注册或登录
    NSString *userName = @"lisi@Macintosh.local";
    NSString *hostName = @"Macintosh.local";
    _jid = userName;
    
    
    //3.设置xmppStream的JID和主机
    [_xmppStream setMyJID:[XMPPJID jidWithString:userName]];
    [_xmppStream setHostName:hostName];
    
    //4.开始连接
    NSError *error = nil;
    [_xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error];
    if(error)
    {
        NSLog(@"连接出错 : %@",error.localizedDescription);
    }
    else
    {
        NSLog(@"连接请求发送成功");
    }
  
}
//断开连接
-(void)disConnect
{
    [self goOfline];
    [_xmppStream disconnect];
}


//销毁XMPPStream并注销已注册的扩展模块
-(void)teardownStream
{
    [_xmppStream removeDelegate:self];
    [_xmppRoster removeDelegate:self];
    //取消激活在setupStream方法中激活的模块
    [_xmppReconnect deactivate];
    [_xmppvCardTempModule deactivate];
    [_xmppRoster deactivate];
    
    //断开XMPPStream的连接
    [_xmppStream disconnect];
    
    
    //内存清理
    _xmppStream = nil;
    _xmppReconnect = nil;
    _xmppvCardTempModule = nil;
    _xmppvCardCoreDataStorage = nil;
    _xmppRosterCoreDataStorage = nil;
    _xmppRoster = nil;
}
#pragma mark - xmpp代理方法
//连接完成
-(void)xmppStreamDidConnect:(XMPPStream *)sender
{
    
    //开始发送注册请求
//    [_xmppStream registerWithPassword:@"12345" error:nil];
    
    NSLog(@"连接建立");
    //开始发送身份验证请求
    NSString *password = @"12345";
      NSError *error = nil;
    
    [_xmppStream authenticateWithPassword:password error:nil];
    if(error)
    {
        NSLog(@"连接出错 : %@",error.localizedDescription);
    }
    else
    {
        NSLog(@"连接请求发送成功");
    }
  
}
//注册验证通过
-(void)xmppStreamDidRegister:(XMPPStream *)sender
{
    NSLog(@"注册通过");
    
}
//注册失败
-(void)xmppStream:(XMPPStream *)sender didNotRegister:(DDXMLElement *)error
{
    NSLog(@"注册失败");
}
//登录验证通过
-(void)xmppStreamDidAuthenticate:(XMPPStream *)sender
{
    NSLog(@"身份验证通过");
    

    //注册电子名片
    [self setupCard];
    
    
    //花名册
    [self performSelectorOnMainThread:@selector(setupFetchedController) withObject:nil waitUntilDone:YES];

    
    
    
    
}
//密码错误 ,身份验证失败
-(void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(DDXMLElement *)error
{
    NSLog(@"身份验证失败");
}

//连接失败
-(void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error
{
    NSLog(@"Error is %@",error.localizedDescription);
}



//电子名片
-(void)setupCard
{
    XMPPvCardTemp *myCard = self.xmppvCardTempModule.myvCardTemp;
    if(myCard)
    {
        NSLog(@"已经有电子名片");
        NSLog(@"jid is %@",myCard.jid);
        NSLog(@"mailer is %@",myCard.mailer);
        NSLog(@"nickName is %@",myCard.nickname);
    }
    
    
        //新建电子名片
        myCard = [XMPPvCardTemp vCardTemp];
        myCard.jid = [XMPPJID jidWithString:_jid];
        myCard.mailer = @"297854263@qq.com";
        myCard.nickname = @"小林子";
        //更新保存电子名片
        [self.xmppvCardTempModule updateMyvCardTemp:myCard];
    
    
    
    //[self changePassword:@"12345"];
}

//修改密码
-(void)changePassword:(NSString *)newPw
{
    //修改密码
    NSString *xmlStr = [NSString stringWithFormat:@"<iq type='set' to='lisi@macintosh.local' id='lisi@macintosh.local'>"
                        "<query xmlns='jabber:iq:register'>"
                        "<username>lisi</username>"
                        "<password>%@</password>"
                        "</query>"
                        "</iq>",newPw];
    NSError *error;
    DDXMLElement *xml = [[DDXMLElement alloc]initWithXMLString:xmlStr error:nil];
    if(error)
    {
        NSLog(@"%@",error);
    }
    
    [_xmppStream sendElement:xml];

}

//花名册
-(void)setupFetchedController
{
    NSManagedObjectContext *context = self.xmppRosterCoreDataStorage.mainThreadManagedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"XMPPUserCoreDataStorageObject"];
 
    //初始化几个排序
    NSSortDescriptor *sort1 = [NSSortDescriptor sortDescriptorWithKey:@"displayName" ascending:YES];
    NSSortDescriptor *sort2 = [NSSortDescriptor sortDescriptorWithKey:@"jidStr" ascending:YES];
    [request setSortDescriptors:@[sort1,sort2]];
    
       _fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:@"sectionNum" cacheName:nil];
    

    
    //查询数据
//    NSError *error = nil;
//    [_fetchedResultsController performFetch:&error];
//    
//    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:0];
//
//
//    XMPPUserCoreDataStorageObject *user = [_fetchedResultsController objectAtIndexPath:indexpath];
//    NSLog(@"%@",user.displayName);
//    if(error)
//    {
//        NSLog(@"查询数据 error is %@",error);
//    }
    
}
@end
