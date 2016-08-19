//
//  ViewController1.m
//  BlockDemo
//
//  Created by chenguangjiang on 14-9-29.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController1.h"
#import "Demo.h"
@interface ViewController1 ()
{
    Demo *_demo;
}
@end

@implementation ViewController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
Demo *demo1;
- (void)viewDidLoad
{

 
    [super viewDidLoad];
  //1.
//  __block Demo *demo = [[Demo alloc]init];//这种情况会导致demo与block循环引用 前面加__block表示block直接操作demo的地址   **注意ARC中由于ARC堆对象的生命周期的管理，对__block声明的变量还是会retain一份到block中导致循环 应该还要在前面加上__weak;
//      NSLog(@"%lu",(unsigned long)demo.retainCount);
//    [demo setBlk:^{
//        NSLog(@"%@",demo);
//           NSLog(@"%lu",(unsigned long)demo.retainCount);
//    }];
//    [demo release];
    
    
    
    //2.
    _demo = [[Demo alloc]init];//_demo此时为全局变量,_demo地址是固定的，所以block不会retain _demo,_demo在release后正常释放，但是_demo是self的成员变量,访问_demo必须的访问self,而且block并不知道self何时被释放(例如多线程的回调) 这时会retain self;而self又持有_demo,所以会造成block与self之前的循环
    //解决方法   用一个栈类的指针指向_demo的堆地址 并告诉编译器直接访问这个地址  这样就不会rettin self了
    //注意在ARC中用这种方法 回调的时候block已被释放 demo里调用block()会crash  但是非ARC环境下当定时器还在运行时 _demo就会一直保留直到定时器调用结束才会被释放 即使self已被释放
    
  __block typeof(_demo) testDemo = _demo;
    NSLog(@"%lu",(unsigned long)_demo.retainCount);
    [_demo setBlk:^{
        
        
        NSLog(@"%@",testDemo);
           NSLog(@"%lu",(unsigned long)testDemo.retainCount);
        
    }];
  
   [_demo release];

    
    
    //3.
//    demo1 = [[Demo alloc]init];//而这里的demo1只是静态变量所以不会造成任何的循环引用
//    NSLog(@"%lu",(unsigned long)demo1.retainCount);
//    [demo1 setBlk:^{
//        
//        
//        NSLog(@"%@",demo1);
//        NSLog(@"%lu",(unsigned long)demo1.retainCount);
//        
//    }];
//    
//    [demo1 release];

}


-(void)dosomething
{
    NSLog(@"dosomething");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [super dealloc];
}
- (IBAction)doAct {
    
}
@end
