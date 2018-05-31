//
//  LYMeTableViewController.m
//  BaiSiBuDeJie
//
//  Created by 雷源 on 17/6/30.
//  Copyright © 2017年 Yuanjihua. All rights reserved.
//

#import "LYMeTableViewController.h"
#import "LYSettingTableViewController.h"
#import "LYMeTableViewCell.h"
#import "LYTabCell.h"
#import "LYLoginViewController.h"
#import "LYHotActivityController.h"
#import "LYSeePointViewController.h"
#import "LYManHuaViewController.h"
#import "LYPreviewViewController.h"
#import "LYSearchViewController.h"
@interface LYMeTableViewController ()

@end

@implementation LYMeTableViewController

static NSString * cellIdentify = @"Cell";
static NSString * cell1Indetify = @"Cell1";
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavigationBar];

    [self.tableView registerClass:[LYMeTableViewCell class] forCellReuseIdentifier:cellIdentify];
    [self.tableView registerClass:[LYTabCell class] forCellReuseIdentifier:cell1Indetify];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 设置多个按钮
-(void)setupNavigationBar
{
    UIBarButtonItem * setting = [UINavigationItem itemWithNormalImage:[UIImage imageNamed:@"mine-setting-icon"] highlightImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(setting)];
    
    UIBarButtonItem * night =[UINavigationItem itemWithNormalImage:[UIImage imageNamed:@"mine-moon-icon"] selectImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(night:)];
    
    //[[UINavigationItem itemWithNormalImage:[UIImage imageNamed:@"mine-moon-icon"] selectImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:nil];
    //设置右边按钮
    self.navigationItem.rightBarButtonItems = @[setting,night];
    // 设置标题
    
    self.navigationItem.title = @"我的";
     
}
/*
 修改只读属性 用kvc进行修改
 */

#pragma mark -按钮的选中状态需要手动设置
-(void)night:(UIButton *)btn
{
    btn.selected = !btn.selected;
}


-(void)setting
{
    LYSettingTableViewController * setting = [[LYSettingTableViewController alloc]init];
    setting.hidesBottomBarWhenPushed = YES;//这个属性必须要在跳转之前设置
//    [self.navigationController pushViewController:setting animated:YES];
    [self.navigationController presentViewController:setting animated:YES completion:nil];
    //1 底部tabBar没有隐藏
    
    //按钮样式
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if(section == 0)
    {
        return 1;
    }
    
    else
    {
        return 13;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    
    if(indexPath.section == 1)
    {
        LYMeTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellIdentify forIndexPath:indexPath];
        cell1.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        switch (indexPath.row) {
            case 0:
                cell1.icon.image = [UIImage imageNamed:@"mine_icon_nearby"];
                cell1.label.text = @"附近";
                break;
            case 1:
                cell1.icon.image = [UIImage imageNamed:@"mine_icon_random"];
                cell1.label.text = @"看点";
                break;
            case 2:
                cell1.icon.image = [UIImage imageNamed:@"mine_msg_icon"];
                cell1.label.text = @"消息";
                break;
            case 3:
                cell1.icon.image = [UIImage imageNamed:@"mine-icon-activity"];
                cell1.label.text = @"热门活动";
                break;
            case 4:
                cell1.icon.image = [UIImage imageNamed:@"mine-icon-feedback"];
                cell1.label.text = @"回信";
                break;
            case 5:
                cell1.icon.image = [UIImage imageNamed:@"mine-icon-manhua"];
                cell1.label.text = @"漫画";
                break;
            case 6:
                cell1.icon.image = [UIImage imageNamed:@"mine-icon-nearby"];
                cell1.label.text = @"同城服务";
                break;
            case 7:
                cell1.icon.image = [UIImage imageNamed:@"mine-icon-preview"];
                cell1.label.text = @"天猫";
                break;
            case 8:
                cell1.icon.image = [UIImage imageNamed:@"mine-icon-recentHot"];
                cell1.label.text = @"热点";
                break;
            case 9:
                cell1.icon.image = [UIImage imageNamed:@"mine-icon-search"];
                cell1.label.text = @"搜索";
                break;
            case 10:
                cell1.icon.image = [UIImage imageNamed:@"mine-my-post"];
                cell1.label.text = @"发表";
                break;
            case 11:
                cell1.icon.image = [UIImage imageNamed:@"mine-setting-iconN"];
                cell1.label.text = @"设置";
                break;
            case 12:
                cell1.icon.image = [UIImage imageNamed:@"mine-icon-more"];
                cell1.label.text = @"更多";
                break;
            default:
                break;
        }

        
        return cell1;
    }
    else
    {
        LYMeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify forIndexPath:indexPath];
        cell.icon.image = [UIImage imageNamed:@"setup-head-default"];
        cell.label.text = @"登录/注册";
        cell.backgroundColor = [UIColor lightGrayColor];
                return cell;
    }
    
}

#pragma mark -设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 44;
}

//#pragma mark - 设置分区尾视图高度
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 50;
//}

#pragma mark - 设置分区头视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}


//#pragma mark -设置分区的尾视图
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
//    view.backgroundColor = [UIColor grayColor];
//    return view;
//}

#pragma mark -设置分区的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

#pragma mark -选中cell时调用的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        LYLoginViewController * login = [[LYLoginViewController alloc]init];
        [self.navigationController presentViewController:login animated:YES completion:nil];
    }
    if(indexPath.section == 1)
    {
        LYSettingTableViewController * setting = [[LYSettingTableViewController alloc]init];
        LYHotActivityController * hotActivity = [[LYHotActivityController alloc]init];
        LYSeePointViewController * seePoint = [[LYSeePointViewController alloc]init];
        LYManHuaViewController * manHua = [[LYManHuaViewController alloc]init];
        LYPreviewViewController * preview = [[LYPreviewViewController alloc]init];
        LYSearchViewController * search = [[LYSearchViewController alloc]init];
        switch (indexPath.row) {
            case 11:
                setting.hidesBottomBarWhenPushed = YES;//这个属性必须要在跳转之前设置
                [self.navigationController pushViewController:setting animated:YES];
                break;
            case 3:
                hotActivity.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:hotActivity animated:YES];
                break;
            case 1:
                seePoint.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:seePoint animated:YES];
                break;
            case 5:
                manHua.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:manHua animated:YES];
                break;
            case 7:
                preview.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:preview animated:YES];
                break;
            case 9:
                search.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:search animated:YES];
                break;
            default:
                break;
        }
    }
    
}
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


//
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    return YES;
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
