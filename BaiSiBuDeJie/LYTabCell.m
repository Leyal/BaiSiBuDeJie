//
//  LYTabCell.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/10.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYTabCell.h"
@interface LYTabCell()<UICollectionViewDataSource,UICollectionViewDelegate>

@end
@implementation LYTabCell
static NSString * cellID = @"CellID";
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = 0;
        layout.itemSize = CGSizeMake(50, 50);
        UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor redColor];
  
    }
    
    return self;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random() % 255/255.0 blue:arc4random() %255/255.0 alpha:1];
    return cell;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
