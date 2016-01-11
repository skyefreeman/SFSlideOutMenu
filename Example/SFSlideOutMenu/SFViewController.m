//
//  SFViewController.m
//  SFSlideOutMenu
//
//  Created by Skye on 01/09/2016.
//  Copyright (c) 2016 Skye. All rights reserved.
//

#import "SFViewController.h"
#import "SFSlideOutMenu.h"

@interface SFViewController () <SFSlideOutMenuDelegate>
@property (nonatomic, strong) SFSlideOutMenu *menu;

@end

@implementation SFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.menu = [[SFSlideOutMenu alloc] initWithParentViewController:self style:SFSlideOutMenuStyleRight];
    self.menu.delegate = self;
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
    blurView.frame = self.menu.container.bounds;
    [self.menu.container addSubview:blurView];
    
    self.menu.buttonTitles = @[@"top stories", @"latest stories", @"saved stories"];
    self.menu.buttonSpacing = 10.0;
    self.menu.buttonWidth = self.menu.container.frame.size.width - 10;
    self.menu.buttonCornerRadius = self.menu.buttonHeight/2;
    self.menu.buttonBackgroundColor = [UIColor colorWithWhite:0.000 alpha:0.300];
    self.menu.buttonTitleColor = [UIColor colorWithWhite:1.000 alpha:0.700];
    self.menu.buttonFont = [UIFont systemFontOfSize:15];
    
    self.menu.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.menu.frame.size.width, 65)];
    self.menu.headerView.backgroundColor = [UIColor redColor];
    
    self.menu.footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.menu.container.frame.size.width, self.menu.container.frame.size.width)];
    self.menu.footerView.backgroundColor = [UIColor redColor];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.menu = nil;
}

- (IBAction)togglePressed:(id)sender {
    [self.menu toggleActive];
}

- (void)slideOutMenuButtonSelected:(UIButton *)button {
    for (UIButton *button in self.menu.container.subviews) {
        if (![button isKindOfClass:[UIButton class]]) continue;
        
        button.layer.borderColor = [UIColor clearColor].CGColor;
    }

    button.layer.borderColor = [UIColor whiteColor].CGColor;
    button.layer.borderWidth = 1.5;
    NSLog(@"%@",button);
}

@end
