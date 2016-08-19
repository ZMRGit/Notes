//
//  LoopScrollView.m
//  LoopScrollDemo
//
//  Created by chenguangjiang on 15/11/10.
//  Copyright © 2015年 Dengchenglin. All rights reserved.
//

#import "LoopScrollView.h"
#import "UIImageView+WebCache.h"
@interface LoopScrollView ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIImageView *startImageView;
@property(nonatomic,strong)UIImageView *lastImageView;
@property(nonatomic,strong)UIImageView *currentImageView;
@property(nonatomic,strong)UIImageView *laterImageView;
@property(nonatomic,strong)UIImageView *endImageView;
@end
@implementation LoopScrollView{
    NSInteger _currentIndex;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        _currentIndex = 0;
        self.decelerationRate = 0;
        self.delegate = self;
        self.pagingEnabled = YES;
       
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}
-(UIImageView *)startImageView{
    if(_startImageView == nil){
        _startImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [self addSubview:_startImageView];
    }
    return _startImageView;
}
-(UIImageView *)lastImageView{
    if(_lastImageView == nil){
        _lastImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
        [self addSubview:_lastImageView];
    }
    return _lastImageView;
}
-(UIImageView *)currentImageView{
    if(_currentImageView == nil){
        _currentImageView = [[UIImageView alloc]initWithFrame:CGRectMake(2 *self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
        [self addSubview:_currentImageView];
    }
    return _currentImageView;
}
-(UIImageView *)laterImageView{
    if(_laterImageView == nil){
        _laterImageView = [[UIImageView alloc]initWithFrame:CGRectMake(3 *self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
        [self addSubview:_laterImageView];
    }
    return _laterImageView;
}
-(UIImageView *)endImageView{
    if(_endImageView == nil){
        _endImageView = [[UIImageView alloc]initWithFrame:CGRectMake(4 *self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
        [self addSubview:_endImageView];
    }
    return _endImageView;
}
-(void)setModels:(NSArray *)models{
    if(_models != models){
        _models = [models copy];
    }
    [self reloadView];
    [self reloadViewForData];
}
-(void)reloadView{
    for(UIView *v in self.subviews){
        [v removeFromSuperview];
    }
    [self.startImageView setFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [self.lastImageView setFrame:CGRectMake(self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
    [self.currentImageView setFrame:CGRectMake(2 *self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
    [self.laterImageView setFrame:CGRectMake(3 *self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
    [self.endImageView setFrame:CGRectMake(4 *self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
    [self addSubview:_startImageView];
    [self addSubview:_lastImageView];
    [self addSubview:_currentImageView];
    [self addSubview:_laterImageView];
    [self addSubview:_endImageView];
    self.contentOffset = CGPointMake(2 *self.bounds.size.width, 0);
    self.contentSize = CGSizeMake(5 *self.bounds.size.width, self.bounds.size.height);
    _currentIndex = 0;
}
-(void)reloadViewForData{
    if(_models.count < 1){
        for(UIView *v in self.subviews){
            [v removeFromSuperview];
        }
        return;
    }
    if(_models.count < 2){
        [self.startImageView removeFromSuperview];
        [self.laterImageView removeFromSuperview];
        [self.lastImageView removeFromSuperview];
        [self.endImageView removeFromSuperview];
        [self setContentOffset:CGPointZero];
        [self setContentSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height)];
        [self.currentImageView setFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        [self addSubview:self.currentImageView];
        return;
    }
    [self.startImageView setFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [self.lastImageView setFrame:CGRectMake(self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
    [self.currentImageView setFrame:CGRectMake(2 *self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
    [self.laterImageView setFrame:CGRectMake(3 *self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
    [self.endImageView setFrame:CGRectMake(4 *self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height)];
    [self addSubview:_startImageView];
    [self addSubview:_lastImageView];
    [self addSubview:_currentImageView];
    [self addSubview:_laterImageView];
    [self addSubview:_endImageView];
    
    
    NSMutableArray *array = [[NSMutableArray alloc]initWithArray:self.models];
    if(array.count < 4){
      [array addObjectsFromArray:_models];
    }
    NSInteger startIndex;
    NSInteger lastIndex;
    NSInteger laterIndex;
    NSInteger endIndex;
    startIndex = _currentIndex - 2;
    lastIndex = _currentIndex - 1;
    laterIndex = _currentIndex + 1;
    endIndex = _currentIndex + 2;
    if(startIndex < 0){
        startIndex = array.count + startIndex;
    }
    if(lastIndex < 0){
        lastIndex = array.count + lastIndex;
    }
    if(laterIndex > array.count - 1){
        laterIndex = laterIndex - array.count;
    }
    if(endIndex > array.count - 1){
        endIndex = endIndex - array.count;
    }
    
    LoopScrollModel *startModel = [array objectAtIndex:startIndex];
    LoopScrollModel *lastModel = [array objectAtIndex:lastIndex];
    LoopScrollModel *currentModel = [array objectAtIndex:_currentIndex];
    LoopScrollModel *laterModel = [array objectAtIndex:laterIndex];
    LoopScrollModel *endModel = [array objectAtIndex:endIndex];
     [self.startImageView sd_setImageWithURL:[NSURL URLWithString:startModel.imageUrl]];
    [self.lastImageView sd_setImageWithURL:[NSURL URLWithString:lastModel.imageUrl]];
    [self.currentImageView sd_setImageWithURL:[NSURL URLWithString:currentModel.imageUrl]];
    [self.laterImageView sd_setImageWithURL:[NSURL URLWithString:laterModel.imageUrl]];
     [self.endImageView sd_setImageWithURL:[NSURL URLWithString:endModel.imageUrl]];
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if(scrollView.contentOffset.x > 2 *self.bounds.size.width){
        _currentIndex ++;
    }
    else if (scrollView.contentOffset.x < 2*self.bounds.size.width){
        _currentIndex --;
    }
    NSInteger count = self.models.count;
    if(count < 4){
        count = 2 *count;
    }
    if(_currentIndex > count - 1){
        _currentIndex = 0;
    }
    if(_currentIndex < 0){
        _currentIndex = count - 1;
    }
    [self reloadViewForData];
    [scrollView setContentOffset:CGPointMake(2 *self.bounds.size.width, 0) animated:NO];
}
@end

@implementation LoopScrollModel

+(NSArray *)modelsWithDataSoures:(NSArray *)dataSoures{
    NSMutableArray *models = [NSMutableArray array];
    for(NSDictionary *data in dataSoures){
        LoopScrollModel *model = [[LoopScrollModel alloc]init];
        model.imageUrl = [data objectForKey:@"image"];
        [models addObject:model];
    }
    return models;
}

@end
