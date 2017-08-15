//
//  ViewController.m
//  EmptyDemo
//
//  Created by Apple on 2017/8/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "UIScrollView+PeerEmpty.h"
#import "UIScrollView+PeerRefresh.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tabView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabView setRefreshWithHeaderBlock:^{
        [self head];
    } footerBlock:^{
                [self foot];
    }];
    
    [self.tabView setupEmptyDataText:@"没有数据" tapBlock:^{
        
        //        NSLog(@"xx");
        //        [self head];
    }];
    
}

- (void) head{
    
    [self.dataArray removeAllObjects];
    
    for (int i = 1; i<6; i++) {
        [self.dataArray addObject:@(i)];
    }
    
    [self.tabView headerEndRefreshing];
    
    [self.tabView reloadData];
}


- (void) foot{
    
    for (int i = 1; i<6; i++) {
        [self.dataArray addObject:@(i)];
    }
    [self.tabView footerEndRefreshing];
    
    [self.tabView reloadData];
}


- (IBAction)clearAction:(id)sender {
    
    [self.dataArray removeAllObjects];
    [self.tabView reloadData];
}



#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *SimpleTableViewIdentifier = @"SimpleTableViewIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleTableViewIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableViewIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"row %ld",(long)indexPath.row];
    
    return cell;
}



#pragma mark - Getter Setter

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
