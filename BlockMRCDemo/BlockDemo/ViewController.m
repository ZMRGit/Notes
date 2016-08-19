//
//  ViewController.m
//  BlockDemo
//
//  Created by chenguangjiang on 14-9-26.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "ViewController1.h"
typedef  void (^Blk2)(void);

typedef int (^SumBlockT) (int a, int b);
@interface ViewController ()
{
    int sex;
    Blk2 _blk2;
    NSObject *_obj;
}
@end

@implementation ViewController
-(NSString *)getusername
{
    //账号为qq_＋当前日期＋随机六位数
    //获取当前日期字符串
    NSDate *date = [NSDate date];
    NSDateFormatter *dateformatter = [[[NSDateFormatter alloc]init]autorelease];
    [dateformatter setDateFormat:@"YYYYMMdd"];
    NSString *dateStr = [dateformatter stringFromDate:date];
    //获取随机六位数
    NSMutableString *str = [NSMutableString string];
    for(int i = 0;i < 6;i++)
    {
        NSString *charector = [NSString stringWithFormat:@"%d",arc4random()%9];
        [str appendString:charector];
    }
    //生成最终账号
    NSString *username = [NSString stringWithFormat:@"qq_%@%@",dateStr,str];
    return username;
}
- (void)viewDidLoad
{
    sex = 0;
 
    [super viewDidLoad];
	//声明block
    void (^myblocks)(void) = NULL;
    //给blocks赋值
    myblocks = ^(void){
        NSLog(@"in blocks");
    };
    //调用block
    myblocks();

    
    int (^myblocks2) (int a, int b) = ^(int a, int b){
        int c = a + b;
        return c;
    };
    NSLog(@"%d", myblocks2(2,4));
    
    __block int sum = 0;
    int (^myblocks3)(int a ,int b) = ^(int a,int b){
        sum = a+b;
        return sum;
    };
    NSLog(@"%d",myblocks3(10,20));
    
    
    SumBlockT myblocks4 = ^(int a, int b){
    
        return a + b;
    };
    myblocks4(100 ,200);
    
    
    //非ARC里将block加入数组 字典时要手动copy
    
  
  
    
    
    //block替代代理
    
//    Person *p=[[Person alloc]init];
//    Dog *dog = [[Dog alloc]init];
//    [dog setID:10];
//    [p setDog:dog];
//    [dog release];
    


    
    
    
    [self block1];
    
    
    
    
}
//堆栈
-(void)block1
{
    __block int i = 1;
    int j = 1024;
    void (^blk)(void);
    blk = ^{
        printf("i = %d j = %d",i,j);
      //  j++;
        sex++;
    };
    NSLog(@"栈区 %@",blk);
    j++;
    blk();
    //在对blk初始化时会copy j的值 访问的实际上是j的替身 所以j++不会对blk里的j产生影响  而且不能改变j的值
    //在局部变量前声明__block实际上是告诉blk无需copy i的值  直接访问i的地址
    //全局变量的地址是固定的 所以blk读取修改无影响

    
    

    void(^blk1)(void) = ^{
 
        printf("sex = %d",sex);
    };
    blk1();
    NSLog(@"栈区 %@",blk1);
   
    //在非arc中要创建堆中得block只需Block_copy就可以了 retain则是无效的  在Arc中只要访问了外部变量的block都在堆中
    //在非ARC对非堆中的block retain release都是无效的
    //非ARC中 block中访问全局变量时是直接访问不会retain 访问栈内变量时会retain
    
    //非arc中[[mutableAarry addObject:stackBlock]是不容许的 因为stackBlock返回后就会被释放 所以应该先copy在add  这样写:[mutableAarry addObject:[[stackBlock copy] autorelease]]
    //block_copy堆中的block时不会另外开辟内存 相当于retain
    
    

  
    
    
    void (^blkInheap)(void) = Block_copy(blk);
    blkInheap();
    NSLog(@"%@",blkInheap);
    

    
    //注：BLOCK被另一个BLOCK使用时，另一个BLOCK被COPY到堆上时，被使用的BLOCK也会被COPY。但作为参数的BLOCK是不会发生COPY的
}


- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)next {
    ViewController1 *v = [[ViewController1 alloc]init];
    [self.navigationController pushViewController:v animated:YES];
    [v release];
}

- (IBAction)getRdmAcount {
    for(int i = 0;i < 1000;i++)
    {
        NSLog(@"%@",[self getusername]);
    }
}
@end
