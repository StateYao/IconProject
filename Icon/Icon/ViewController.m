//
//  ViewController.m
//  Icon
//
//  Created by admin on 2018/10/12.
//  Copyright © 2018 BlueSky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *iconTableView;
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataArr = @[@"erp",@"wode",@"lockIn_j",@""];
    self.iconTableView.delegate = self;
    self.iconTableView.dataSource = self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:nil];
    cell.imageView.image = [UIImage imageNamed:self.dataArr[indexPath.section]];
    cell.textLabel.text = [NSString stringWithFormat:@"图片%ld",indexPath.section];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    [self changeAppIconWithName:self.dataArr[indexPath.section]];
    
}

- (void)changeAppIconWithName:(NSString *)iconName {
    if (@available(iOS 10.3, *)) {
        if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
            return;
        }
    } else {
        // Fallback on earlier versions
    }
    
    if ([iconName isEqualToString:@""]) {
        iconName = nil;
    }
    if (@available(iOS 10.3, *)) {
        
        [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"更换app图标发生错误了 ： %@",error);
            }
        }];
    } else {
        // Fallback on earlier versions
    }
}

@end
