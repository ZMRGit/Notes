//
//  ViewController.m
//  CoreData
//
//  Created by chenguangjiang on 14-8-1.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Test1.h"
@interface ViewController ()
{
    AppDelegate *dele;

}
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
     dele = [UIApplication sharedApplication].delegate;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *but1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [but1 setFrame:CGRectMake(50, 50, 50, 50)];
    but1.backgroundColor = [UIColor brownColor];
    [but1 addTarget:self action:@selector(act1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
   
    UIButton *but2= [UIButton buttonWithType:UIButtonTypeCustom];
    [but2 setFrame:CGRectMake(50, 150, 50, 50)];
    but2.backgroundColor = [UIColor brownColor];
    [but2 addTarget:self action:@selector(act2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but2];
    
    
  

}

-(void)act1
{
    [self insertCoreData];
}
-(void)act2
{
    [self dataFetchRequest];
}
-(void)insertCoreData
{
    NSManagedObjectContext *context = [dele managedObjectContext];

    for(int i = 0;i < 5;i++)
    {
        NSManagedObject *text1 = [NSEntityDescription insertNewObjectForEntityForName:@"Test1" inManagedObjectContext:context];
        [text1 setValue:[NSString stringWithFormat:@"haha%d",i] forKey:@"name"];
        [text1 setValue:@"23" forKey:@"age"];
        [text1 setValue:@"297854263@qq.com" forKey:@"email"];
  
    
        NSManagedObject *text2 = [NSEntityDescription insertNewObjectForEntityForName:@"Test2" inManagedObjectContext:context];
        [text2 setValue:@"1" forKey:@"id"];
        [text2 setValue:@"adress" forKey:@"adress"];
        [text1 setValue:text2 forKey:@"info"];
        [text2 setValue:text1 forKey:@"details"];
    
    }
    NSError *error;
    if(![context save:&error])
    {
        NSLog(@"不能保存: %@",[error localizedDescription]);
    }

    
}

-(void)dataFetchRequest
{
    NSManagedObjectContext *context = [dele managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Test2" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for(NSManagedObject *info in fetchedObjects)
    {
        NSLog(@"%@",[info valueForKey:@"adress"]);
        Test1 *test1 = [info valueForKey:@"details"];
        NSLog(@"%@",test1.name);
        
    }
    
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
