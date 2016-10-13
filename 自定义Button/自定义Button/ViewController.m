//
//  ViewController.m
//  自定义Button
//
//  Created by Wangguibin on 16/4/11.
//  Copyright © 2016年 王贵彬. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+PXYCustom.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *mybutton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *but=[UIButton buttonWithType:UIButtonTypeCustom];
    but.frame=CGRectMake(100, 100, 100 , 100);
    [but setTitle:@"按钮" forState:UIControlStateNormal];
    [but setBackgroundColor:[UIColor purpleColor]];
    [but setTintColor:[UIColor greenColor]];
    [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [but setImage:[UIImage imageNamed:@"11111"] forState:UIControlStateNormal];
    [self.view addSubview:but];
    [but addTapBlock:^(UIButton *sender) {
        NSLog(@"oooo");
        
    }];
    [self.mybutton addTapBlock:^(UIButton *sender) {
        NSLog(@"来呀点我,快来点我");
        
    }];
    //标题在上
    //[but  titleTopButtonImageWithTitleStyle:PXYCustomerButtonTypeTop Space:5];
    //标题在左
    //[but  titleTopButtonImageWithTitleStyle:PXYCustomerButtonTypeLeft Space:5];
    //标题在右
      //[but  titleTopButtonImageWithTitleStyle:PXYCustomerButtonTypeRight Space:5];
    //    //标题在下
     [but  titleTopButtonImageWithTitleStyle:PXYCustomerButtonTypeBelow Space:5];
    //[but titleOverTheImageTopWithSpace:0];
    self.mybutton.backgroundColor = [UIColor whiteColor];
    
    
    
    
    
}

- (void)viewWillLayoutSubviews {
    //    [but  titleBelowTheImageWithSpace:0];
    [self.mybutton titleTopButtonImageWithTitleStyle:PXYCustomerButtonTypeTop Space:5];
    //[self.mybutton titleOverTheImageTopWithSpace:0];
    [self.mybutton setImage:[[UIImage imageNamed:@"11111"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
       [self.mybutton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
     [self.mybutton setBackgroundColor:[UIColor purpleColor]];
    [self.mybutton setTitle:@"按钮" forState:UIControlStateNormal];
    [super viewWillLayoutSubviews];
    
}



@end
