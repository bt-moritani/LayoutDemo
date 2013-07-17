//
//  MainViewController.m
//  LayoutDemo
//
//  Created by Yukimitsu MORITANI on 2013/07/16.
//  Copyright (c) 2013年 Brain Trust Co., Ltd. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuBarButton;
@end

@implementation MainViewController

- (IBAction)menuBarButtonAction:(id)sender {
    
    [self.baseVC showMenuWithCompletion:^(BOOL finished){
        NSLog(@"%s", __PRETTY_FUNCTION__);
    }];

}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
