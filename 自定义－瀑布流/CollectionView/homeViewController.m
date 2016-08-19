//
//  homeViewController.m
//  CollectionView
//
//  Created by d2space on 14-2-12.
//  Copyright (c) 2014年 D2space. All rights reserved.
//

#import "homeViewController.h"
#import "WaterFLayout.h"

@interface homeViewController ()

@end

@implementation homeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray* urls = @[
                      @"http://img0.bdstatic.com/img/image/shouye/leimu/mingxing.jpg",
                      @"http://img.baidu.com/img/image/3bf33a87e950352a5947ae485143fbf2b2.jpg",
                      @"http://img1.bdstatic.com/img/image/8662934349b033b5bb5c55e5d9834d3d539b700bcce.jpg",
                      @"http://imgstatic.baidu.com/img/image/7af40ad162d9f2d3cdc19be8abec8a136227cce1.jpg",
                      @"http://imgstatic.baidu.com/img/image/weimeiyijing0207.jpg",
                      @"http://e.hiphotos.baidu.com/image/w%3D400/sign=2e56c8010ed79123e0e095749d355917/ae51f3deb48f8c5470385d2638292df5e1fe7fd4.jpg",
                      @"http://c.hiphotos.baidu.com/image/w%3D400/sign=e37cc47c6509c93d07f20ff7af3cf8bb/7a899e510fb30f2468cc6271ca95d143ad4b0369.jpg",
                      @"http://b.hiphotos.baidu.com/image/w%3D400/sign=ac0b8e2b92ef76c6d0d2fa2bad17fdf6/a71ea8d3fd1f4134dedc5974271f95cad0c85ed4.jpg",
                      @"http://imgstatic.baidu.com/img/image/huacaozhiwu0207.jpg",
                      @"http://d.hiphotos.baidu.com/image/w%3D400/sign=7d27c75af4246b607b0eb374dbf81a35/5882b2b7d0a20cf4f28367d674094b36acaf99ac.jpg",
                      @"http://f.hiphotos.baidu.com/image/w%3D400/sign=657110132ff5e0feee1888016c6134e5/c83d70cf3bc79f3d6db2fb3ab8a1cd11728b296c.jpg",
                      @"http://g.hiphotos.baidu.com/image/w%3D400/sign=4be7f3c141166d223877149476230945/e850352ac65c10384d5fbac8b0119313b07e8992.jpg",
                      @"http://imgstatic.baidu.com/img/image/meinvbizhi0207.jpg",
                      @"http://h.hiphotos.baidu.com/image/w%3D400/sign=880260efb68f8c54e3d3c42f0a292dee/d0c8a786c9177f3e405a5a0c72cf3bc79f3d5640.jpg",
                      @"http://a.hiphotos.baidu.com/image/w%3D400/sign=55af4af479899e51788e3b1472a7d990/f9198618367adab42ab8824a89d4b31c8701e44b.jpg",
                      @"http://imgstatic.baidu.com/img/image/a50f4bfbfbedab64947d23a7f536afc379311e4d.jpg",
                      @"http://img2.bdstatic.com/img/image/5086f061d950a7b0208c22b6db060d9f2d3562cc885.jpg",
                      @"http://imgstatic.baidu.com/img/image/6a.jpg",
                      ];
    
    self.texts = @[
                       @"第一页，Contrast is the visual difference between two elements; this could be through color, texture, or other elements of style. The text on the left has high contrast because the color of the text is very different than the color of the background, making it very visible. The text on the right has very low contrast with its background, making it nearly invisible. Notice how your eye is automatically drawn to the box on the left. The drawing power of high contrast elements should be used to advantage in your designs.",
                       @"The red lines indicate horizontal alignment. Most elements on the screen are not precisely aligned to any other element, resulting in an unhealthy number of lines. What makes matters worse is that the lines don’t seem to have any consistent pattern or equal spacing.",
                       @"Developers are often very concerned about using the screen as efficiently as possible and filling up every pixel of the screen with stuff. While this might be efficient, it also generates a confusing mess because whitespace — the space on the screen without stuff — is your most powerful tool for organizing elements into logical sections, helping your user to effortlessly make sense of the content.",
                       @"Sans serif fonts like Helvetica Neue, Apple’s preferred font in iOS 7, don’t have embellishments on letters; they look cleaner and lend themselves well to smaller pieces of text such as headings and controls.",
                       @"Notice how the Status Bar is always blended with the Navigation Bar; always strive to blend these two elements together in a tasteful way.",
                       @"Apple tends to make the chrome in their iOS 7 apps the same color as the app’s primary background in an attempt to make the chrome disappear. This may work in some cases but keep in mind that doing this could very well have the opposite effect because it causes the chrome to visually blend with the content, making it harder distinguish the two. When chrome and content look the same, they both look equally as important – defeating the purpose of hiding the chrome. In other words, a contrasting background for chrome may not always be a bad thing.",
                       @"Hide the chrome when possible",
                       @"The borders Apple uses in iOS 7 tend to be thin but distinct. Apple’s buttons generally use transparent backgrounds for their unselected state and simple colored backgrounds for their selected state. Experiment with things such as border weight, background color, transparency, the radius of the rounded corners, or subtle shadows and textures when seeking a unique button style for your app.",
                       @"Make content king",
                       @"Use the whole screen",
                       @"So how do you stand out on iOS 7? How do you create a delightful personality without mind-blowing graphics? In short, app design in the new paradigm will be less about how your app looks and a lot more about how it works and feels. I think the de-emphasis of visuals in iOS 7 will generate a renaissance of innovation in touch interaction design.",
                       @"What a shame it would have been for Apple to nail 1:1 scrolling but not follow through with the inertia and bounciness you have come to know and love. Direct manipulation goes hand in hand with physics and animation; the goal is to make the interactions feel real.",
                       @"3D Effects",
                       @"Tilt your iPhone and you will see that the icons are not actually sitting on the background — the parallax effect reveals they’re floating above it instead. Bring up Control Center and the frosted glass makes it very apparent that Control Center is a layer above all the icons. Think about your interface in layers and use 3D effects to make the purpose of the layers clear to your user.",
                       @"Gestures and navigation",
                       @"However, soiven UI.",
                       @"Adding gravity",
                       @"However, there’s still something not quite right with the interaction between the two objects. The barrier is supposed to be immovable, but when the two objects collide in your current configuration the barrier is knocked out of place and starts spinning towards the bottom of the screen.Even more oddly, the barrier bounces off the bottom of the screen and doesn’t quite settle down like the square – this makes sense because the gravity behavior doesn’t interact with the barrier. This also explains why the barrier doesn’t move until the square collides with it.Looks like you need a different approach to the problem. Since the barrier view is immovable, there isn’t any need to for the dynamics engine to be aware of its existence. But how will the collision be detected?"
                       ];

    NSMutableArray* URLS = [[NSMutableArray alloc]initWithCapacity:30];
    for (int i = 0; i<urls.count; i++)
    {
        [URLS addObject:[NSURL URLWithString:urls[i]]];
    }
    self.images = [[NSMutableArray alloc]initWithCapacity:30];
    for (int i = 0; i<urls.count; i++)
    {
        NSData* data = [[NSData alloc]initWithContentsOfURL:URLS[i]];
        [self.images addObject:[UIImage imageWithData:data]];
    }
    SEL addCView = @selector(addWaterFollow:);
    UIButton* collectionViewAdd = [UIButton buttonWithType:UIButtonTypeSystem];
    collectionViewAdd.frame = CGRectMake(50, 120, 100, 40);
    [collectionViewAdd setTitle:@"CollectionBtn" forState:UIControlStateNormal];
    [collectionViewAdd addTarget:self action:addCView forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:collectionViewAdd];
    
}

- (void)addWaterFollow:(UIButton*)btn
{
//    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    WaterFLayout* flowLayout = [[WaterFLayout alloc]init];
    self.waterfall = [[WaterF alloc]initWithCollectionViewLayout:flowLayout];
    self.waterfall.imagesArr = self.images;
    self.waterfall.textsArr = self.texts;
    self.waterfall.sectionNum = 2;
    self.waterfall.imagewidth = 150;
    [self.view addSubview:self.waterfall.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
