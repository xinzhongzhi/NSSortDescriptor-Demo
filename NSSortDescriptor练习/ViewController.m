//
//  ViewController.m
//  NSSortDescriptor练习
//
//  Created by 辛忠志 on 2017/8/1.
//  Copyright © 2017年 辛忠志. All rights reserved.
//
#define HRXIB(Class) [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([Class class]) owner:nil options:nil] firstObject];
#import "ViewController.h"
#import "person.h"
#import "xzzTableViewCell.h"
@interface ViewController ()
@property(nonatomic,strong)NSMutableArray *datas;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

@implementation ViewController
- (NSMutableArray *)datas
{
    if (!_datas) {
        
        _datas = [NSMutableArray array];
        
        person *p1 = [[person alloc] initWithName:@"阿涛" age:20 score:97];
        person *p2 = [[person alloc] initWithName:@"阳哥" age:8 score:33];
        person *p3 = [[person alloc] initWithName:@"壮壮" age:54 score:11];
        person *p4 = [[person alloc] initWithName:@"橙子" age:76 score:54];
        person *p5 = [[person alloc] initWithName:@"张三" age:95 score:12];
        person *p6 = [[person alloc] initWithName:@"李四" age:21 score:76];
        person *p7 = [[person alloc] initWithName:@"王二" age:53 score:98];
        person *p8 = [[person alloc] initWithName:@"小刘" age:33 score:66];
        person *p9 = [[person alloc] initWithName:@"小李" age:33 score:21];
        person *p10 = [[person alloc] initWithName:@"小赵" age:69 score:88];
        
        [_datas addObject:p1];
        [_datas addObject:p2];
        [_datas addObject:p3];
        [_datas addObject:p4];
        [_datas addObject:p5];
        [_datas addObject:p6];
        [_datas addObject:p7];
        [_datas addObject:p8];
        [_datas addObject:p9];
        [_datas addObject:p10];
        
        
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * array = @[@"abc",@"bcd",@"acd",@"acd",@"acd",@"ctk",@"tck",@"ack"];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *arr1 = [array sortedArrayUsingDescriptors:@[sort]];
    NSLog(@"%@",arr1);
}
#pragma mark - ---------- Lazy Loading（懒加载） ----------

#pragma mark - ----------   Lifecycle（生命周期） ----------

#pragma mark - ---------- Private Methods（私有方法） ----------

#pragma mark initliaze data(初始化数据)

#pragma mark config control（布局控件）

#pragma mark networkRequest (网络请求)

#pragma mark actions （点击事件）

#pragma mark IBActions （点击事件xib）
- (IBAction)paixu:(UIButton *)sender {
    NSSortDescriptor *ageSD = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
    NSSortDescriptor *scoreSD =[NSSortDescriptor sortDescriptorWithKey:@"score" ascending:NO];
    self.datas = [[self.datas sortedArrayUsingDescriptors:@[ageSD,scoreSD]] mutableCopy];
    [self.mainTableView reloadData];
}

#pragma mark - ---------- Public Methods（公有方法） ----------

#pragma mark self declare （本类声明）

#pragma mark override super （重写父类）

#pragma mark setter （重写set方法）

#pragma mark - ---------- Protocol Methods（代理方法） ----------
#pragma mark ----------------UITableViewDataSource---------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*去掉系统分割线**/
    self.mainTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    xzzTableViewCell * cell = HRXIB(xzzTableViewCell);
    /* 去掉cell点击阴影**/
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    person *p = self.datas[indexPath.row];
    
    cell.fontLabel.text = [NSString stringWithFormat:@"姓名：%@  年龄：%ld米",p.name,(long)p.age];
    cell.backLabel.text =[NSString stringWithFormat:@"月收入:%fK", p.score];
    /*设置文字和图片*/
    return cell;
}
#pragma mark ----------------UITableViewDelegate---------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 51;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
