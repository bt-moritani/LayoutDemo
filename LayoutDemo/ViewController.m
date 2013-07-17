//
//  ViewController.m
//  LayoutDemo
//
//  Created by Yukimitsu MORITANI on 2013/07/15.
//  Copyright (c) 2013年 Brain Trust Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *menuContainer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mainViewLeftConstraint;
@end


@implementation ViewController


- (void)showMenuWithPoint:(CGPoint)point
               completion:(void (^)(BOOL finished))completion
{
    
    
    self.mainViewLeftConstraint.constant = point.x;
    
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished){
                         [self updateViewConstraints];
                         completion(finished);
                     }];

}


- (void)showMenuWithCompletion:(void (^)(BOOL finished))completion
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    
    self.mainViewLeftConstraint.constant = (self.mainViewLeftConstraint.constant == 0.0 ? CGRectGetWidth(_menuContainer.frame) : 0.0);
    
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished){
                         [self updateViewConstraints];
                         completion(finished);
                     }];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *identifier = segue.identifier;
    
    
    if ([identifier isEqualToString:@"embedMainSegue"])
    {
        UINavigationController *nc = segue.destinationViewController;
        MainViewController *mainVC = nc.viewControllers[0];
        
        mainVC.baseVC = self;
    }
}

@end
