//
//  SFViewController.m
//  SFSlideOutMenu
//
//  Created by Skye on 01/09/2016.
//  Copyright (c) 2016 Skye. All rights reserved.
//

#import "SFViewController.h"
#import "SFSlideOutMenu.h"

@interface SFViewController ()
@property (nonatomic, strong) SFSlideOutMenu *menu;

@end

@implementation SFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.menu = [[SFSlideOutMenu alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width/3, self.view.frame.size.height)];
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
    blurView.frame = self.menu.bounds;
    [self.menu addSubview:blurView];
    
    self.menu.buttonTitles = @[@"top stories", @"latest stories", @"saved stories"];
    self.menu.buttonSpacing = 4.0;
    self.menu.buttonWidth = self.menu.frame.size.width - 10;
    self.menu.buttonCornerRadius = self.menu.buttonHeight/2;
    self.menu.buttonBackgroundColor = [UIColor colorWithWhite:0.000 alpha:0.300];
    self.menu.buttonTitleColor = [UIColor colorWithWhite:1.000 alpha:0.700];
    self.menu.buttonFont = [UIFont systemFontOfSize:15];
}

- (IBAction)togglePressed:(id)sender {
    [self.menu toggleActive];
}

@end
