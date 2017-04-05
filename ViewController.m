//
//  ViewController.m
//  UiTableViewCell输入取值
//
//  Created by cocolee on 2017/4/5.
//  Copyright © 2017年 cocolee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong)UITableView *Mytable;
@property(nonatomic,strong)NSArray *ShowArr;
@property(nonatomic,strong)UITextField *EntText;
@property(nonatomic,strong)NSString *Name;
@property(nonatomic,strong)NSString *Sex;




@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _ShowArr = @[@"姓名:",@"性别"];
    [self Mytable];
}
-(UITableView*)Mytable{
    if (!_Mytable) {
        _Mytable =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _Mytable.delegate = self;
        _Mytable.dataSource = self;
        [self.view addSubview:_Mytable];
    }
    return  _Mytable;
    
}

#pragma Tab

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _ShowArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify =@"Cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.selectionStyle =   UITableViewCellSelectionStyleNone;//点击效果取消
    }
    
    _EntText =[[UITextField alloc]initWithFrame:CGRectMake(0, 0, 300, 60)];
    _EntText.delegate = self;
    _EntText.returnKeyType = UIReturnKeyDone;
    _EntText.tag =indexPath.row;
    _EntText.clearButtonMode = YES;
    _EntText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [_EntText addTarget:self action:@selector(TextChang:) forControlEvents:UIControlEventEditingDidEnd];
   
    cell.textLabel.text =[_ShowArr objectAtIndex:indexPath.row];
    cell.accessoryView = _EntText;
    
    
        return cell;
    
}

-(void)TextChang:(UITextField*)textField{
    switch (textField.tag) {
        case 0:{
            self.Name =[NSString stringWithFormat:@"%@",textField.text];
            NSLog(@"%@",self.Name);
        }
            
            break;
            
        case 1:{
            self.Sex = [NSString stringWithFormat:@"%@",textField.text];
            NSLog(@"%@",self.Sex);
        }
            
            break;
        default:
            break;
    }
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:NO];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
