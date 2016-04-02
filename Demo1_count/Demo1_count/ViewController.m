//
//  ViewController.m
//  Demo1_count
//
//  Created by  江苏 on 16/3/8.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView1;
@property (strong, nonatomic) IBOutlet UIImageView *imageView2;
@property (strong, nonatomic) IBOutlet UIImageView *imageView3;
@property (strong, nonatomic) IBOutlet UILabel *countLabel;
@property (strong, nonatomic) IBOutlet UILabel *countLabel2;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;
@property(strong,nonatomic)UIImageView* dravImageView;
@end

@implementation ViewController
int i=0,j=0;
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)pan2:(UIPanGestureRecognizer *)sender {
    CGPoint p2=[sender locationInView:self.view];
    if (CGRectContainsPoint(self.imageView1.frame, p2)) {
        self.dravImageView.frame=self.imageView1.frame;
        self.dravImageView.image=self.imageView1.image;
        self.dravImageView.center = p2;
        [self.view addSubview:self.dravImageView];
    }else if(CGRectContainsPoint(self.imageView2.frame, p2)){ 
//        UIImageView* dravImageView=[[UIImageView alloc]initWithFrame:self.imageView2.frame];
//        dravImageView.image=self.imageView2.image;
//        self.dravImageView=dravImageView;
        self.dravImageView.frame=self.imageView2.frame;
        self.dravImageView.image=self.imageView2.image;
        self.dravImageView.center = p2;
        [self.view addSubview:self.dravImageView];
    }else if (CGRectContainsPoint(self.imageView3.frame, p2)){
        self.dravImageView.frame=self.imageView3.frame;
        self.dravImageView.image=self.imageView3.image;
        self.dravImageView.center = p2;
        [self.view addSubview:self.dravImageView];
    }
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    CGPoint p2=[touch locationInView:self.view];
    if (CGRectContainsPoint(self.imageView1.frame, p2)) {
        self.dravImageView.center=p2;
        [self panduan:self.imageView1.center imageView:self.dravImageView];
    }else if(CGRectContainsPoint(self.imageView2.frame, p2)){
        self.dravImageView.center=p2;
        [self panduan:self.imageView2.center imageView:self.dravImageView];
    }else if (CGRectContainsPoint(self.imageView3.frame, p2)){
        self.dravImageView.center=p2;
        [self panduan:self.imageView3.center imageView:self.dravImageView];
    }
    
}
-(void)panduan:(CGPoint)point imageView:(UIImageView*)imageView{
    if (CGRectContainsPoint(self.view1.frame, point)) {
        i++;
        self.countLabel.text=[NSString stringWithFormat:@"%d",i];
        [self.view addSubview:imageView];
    }else if(CGRectContainsPoint(self.view2.frame, point)) {
        j++;
        self.countLabel2.text=[NSString stringWithFormat:@"%d",j];
        [self.view addSubview:imageView];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
