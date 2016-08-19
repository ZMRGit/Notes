//
//  ViewController1.m
//  BlockARCDemo
//
//  Created by chenguangjiang on 15-1-17.
//  Copyright (c) 2015年 chenguangjiang. All rights reserved.
//

#import "ViewController1.h"
#import "Demo.h"
@interface ViewController1 ()
{
    Demo *_demo;
    Demo *_demo1;
}
@end

@implementation ViewController1

Demo *demo1;

-(instancetype)init
{
    if(self = [super init])
    {
        _demo1 = [[Demo alloc]init];
       
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //1.//会循环引用
    
//    Demo *demo = [[Demo alloc]init];
//   
//    /*
//     非ARC的解决方案 直接前面加__block
//     __block Demo *demo = [[Demo alloc]init];
//     但是ARC中由于ARC对对象生命周期的管理方式,即使加上__block在block里还是会retain demo而导致循环引用
//     但是也不能直接在前面加__weak 因为__weak修饰的指针未持有demo对象  demo很可能立即被释放掉
//     __weak Demo *demo = [[Demo alloc]init];
//     */
//    
//    //解决方案1
//    /*
//      Demo *demo = [[Demo alloc]init];相当于
//     __strong Demo *demo = [[Demo alloc]init]
//     该对象已被持有 再用另一个__weak指针指向它 他是不会立即被释放的
//     */
//    
//    __weak typeof(demo) testDemo = demo;
//        [demo setBlk:^{
//            NSLog(@"%@",testDemo);
//         
//        }];

    
    
    
    //2.
//    /*
//     _demo = [[Demo alloc]init];
//     __block typeof(_demo) testDemo = _demo;
//     [_demo setBlk:^{
//     
//     
//     NSLog(@"%@",testDemo);
//     }];
//  
// 
//        尽管_demo为全局变量 在ARC中block不知道_demo何时会被释放所以仍会retain _demo  并且retain self 导致_demo self block三者间的循环 任意一个都得不到释放
//    
//
//    
//        非ARC下可以加另外声明一个__block修饰的栈类指针指向这个demo;
//        __block typeof(_demo) testDemo = _demo;
//        在ARC中这样做block就不会retain 但是_demo的初始化地点在栈内，回调的时候由于ARC对对象的生命周期的管理方式block已经被释放 这时demo调用block()就会crash
//        同样改为__weak也不行
//  
//     */
//    
//  //解决方案 _demo在self init初始化时初始化  这样_demo的释放周期就会与self绑定在一起 也不用担心在回调后_demo已经被释放  这里NSTimer未调用完毕时_demo会一直保留 即使self已被释放
//   
//    
// 
//    __weak typeof(_demo1) testDemo = _demo1;
//    [_demo1 setBlk:^{
//    
//        NSLog(@"%@",testDemo);
//    }];
    

    
    

    
    
    
    //3.
    
//   //与上面不同的是 demo1并不是self的成员变量  ARC中不管demo1在哪里初始化都不能保证它在定时器结束后再释放 所以不建议使用这种方法
//    
//    
//    demo1 = [[Demo alloc]init];
//  
//    __weak typeof (demo1)  testDemo = demo1;
//    [demo1 setBlk:^{
//        
//        
//        NSLog(@"%@",testDemo);
//
//        
//    }];
    

}
- (void)dealloc
{
    NSLog(@"self dealloc");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
