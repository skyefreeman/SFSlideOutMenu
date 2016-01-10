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
    
    self.menu = [[SFSlideOutMenu alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 0, self.view.frame.size.width/2, self.view.frame.size.height)];
    self.menu.backgroundColor = [UIColor redColor];
    
    self.menu.buttonTitles = @[@"One",@"Two"];
    self.menu.buttonSpacing = 2.0;
    self.menu.buttonWidth = self.menu.frame.size.width - 10;
    self.menu.buttonCornerRadius = self.menu.buttonHeight/2;
}

@end
