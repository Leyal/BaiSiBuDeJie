//
//  LYSettingTableViewController.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/7/2.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYSettingTableViewController.h"

@interface LYSettingTableViewController ()
@property(nonatomic,strong) CAEmitterLayer * fireEmitter;
@end

@implementation LYSettingTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor whiteColor];
//    self.navigationItem.title = @"设置";
    self.navigationController.navigationBar.hidden = YES;
    
    
//    [self setReturnButton];
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;

//    [self testAnimation];
    [self setFire];

    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark -火焰发射动画
-(void)setFire
{
    self.view.backgroundColor = [UIColor blackColor];
    //设置发射器
    _fireEmitter = [[CAEmitterLayer alloc]init];
    _fireEmitter.emitterPosition = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height-20);
    //发射器大小
    _fireEmitter.emitterSize = CGSizeMake(self.view.frame.size.width-100, 20);
    _fireEmitter.renderMode = kCAEmitterLayerAdditive;//附加模式
    //发射单元 火焰
    CAEmitterCell * fire = [CAEmitterCell emitterCell];
    fire.birthRate = 1600;
    fire.lifetime = 4.0;
    fire.lifetimeRange = 1.5;
    fire.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1]CGColor];
    fire.contents = (id)[[UIImage imageNamed:@"fireOval"]CGImage];
    [fire setName:@"fire"];
    fire.velocity = 160;
    fire.velocityRange = 80;
    fire.emissionLongitude = M_PI_2+M_PI;
    fire.emissionRange = M_PI_2;
    fire.scaleSpeed = 0.3;
    fire.spin = 0.2;
    
    //烟雾
    CAEmitterCell * smoke = [CAEmitterCell emitterCell];
    smoke.birthRate = 800;
    smoke.lifetime = 6.0;
    smoke.lifetimeRange = 1.5;
//    smoke.color = [[UIColor colorWithRed:1 green:1 blue:1 alpha:0.05]CGColor];
    smoke.color = [[UIColor colorWithRed:1 green:1 blue:1 alpha:0.2]CGColor];
    smoke.contents = (id)[[UIImage imageNamed:@"fireOval"]CGImage];
    [smoke setName:@"smoke"];
    smoke.velocity = 250;
    smoke.velocityRange = 100;
    smoke.emissionLongitude = M_PI_2+ M_PI;
    smoke.emissionRange = M_PI_2;
    _fireEmitter.emitterCells = [NSArray arrayWithObjects:fire,smoke, nil];
    [self.view.layer addSublayer:_fireEmitter];
    
}
-(void)testAnimation
{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    imageView.image = [UIImage imageNamed:@"addPerson1.jpg"];
    [self.view addSubview:imageView];
    NSMutableArray * array = [[NSMutableArray alloc]init];
    for(int i =0;i<11;i++)
    {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"addPerson%d.jpg",i+1]];
        [array addObject:image];
    }
    imageView.animationImages = array;
    imageView.animationDuration = 1;
    imageView.animationRepeatCount = 0;
    [imageView startAnimating];
}

-(void)setReturnButton
{
    
    
    UIButton * returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [returnButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [returnButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
    [returnButton setTitle:@"返回" forState:UIControlStateNormal];
    [returnButton setTitle:@"返回" forState:UIControlStateHighlighted];
    [returnButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [returnButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    //设置按钮内容边距   往哪边移动  就改哪边的值
    returnButton.contentEdgeInsets = UIEdgeInsetsMake(0, -17, 0, 0);
    [returnButton sizeToFit];
    [returnButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:returnButton];
//
//    self.navigationItem.leftBarButtonItem = [UINavigationItem r
    
                                             
    //ReturnWithNormalImage:[UIImage imageNamed:@"navigationButtonReturn"] highlightImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) title:@"返回"];
                                             
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
//-(void)setJump
//{
//    UIButton * jump = [UIButton buttonWithType:UIButtonTypeCustom];
//    [jump setTitle:@"jump" forState:UIControlStateNormal];
//    [jump addTarget:self action:@selector(backR) forControlEvents:UIControlEventTouchUpInside];
//    [jump sizeToFit];
//    self.navigationItem.rightBarButtonItem  = [[UIBarButtonItem alloc]initWithCustomView:jump];

    
//    self.navigationItem.rightBarButtonItem = [UINavigationItem setReturnButtonWithNormalImage:[UIImage imageNamed:@"navigationButtonReturn"] highlightImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) title:@"jump"];
//}

//-(void)backR
//{
//    UIViewController * vc = [[UIViewController alloc]init];
//    vc.view.backgroundColor = [UIColor yellowColor];
//    
//    [self.navigationController pushViewController:vc animated:YES];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
