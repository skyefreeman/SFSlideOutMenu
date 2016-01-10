//
//  SFSlideOutMenu.m
//  Pods
//
//  Created by Skye on 1/9/16.
//
//

#import "SFSlideOutMenu.h"

@interface SFSlideOutMenu()

@end

@implementation SFSlideOutMenu

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    self.buttonSpacing = 0;
    self.buttonCornerRadius = 0;
    self.buttonHeight = 50;
    self.buttonWidth = frame.size.width;
    
    self.windowLevel = UIWindowLevelStatusBar;
    self.hidden = NO;
    
    return self;
}

#pragma mark - Method Overrides
- (void)layoutSubviews {
    CGFloat currentOriginHeight = self.buttonSpacing;
    for (UIButton *button in self.subviews) {
        if (![button isKindOfClass:[UIButton class]]) continue;
        
        [button setFrame:CGRectMake(self.frame.size.width/2 - self.buttonWidth/2, currentOriginHeight,self.buttonWidth,self.buttonHeight)];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button.layer setCornerRadius:self.buttonCornerRadius];
        
        currentOriginHeight += button.frame.size.height + self.buttonSpacing;
    }
}

- (void)setButtonSpacing:(CGFloat)buttonSpacing {
    _buttonSpacing = buttonSpacing;
    [self layoutSubviews];
}

- (void)setButtonCornerRadius:(CGFloat)buttonCornerRadius {
    _buttonCornerRadius = buttonCornerRadius;
    [self layoutSubviews];
}

- (void)setButtonHeight:(CGFloat)buttonHeight {
    _buttonHeight = buttonHeight;
    [self layoutSubviews];
}

- (void)setButtonWidth:(CGFloat)buttonWidth {
    _buttonWidth = buttonWidth;
    [self layoutSubviews];
}

- (void)setButtonTitles:(NSArray *)buttonTitles {
    _buttonTitles = buttonTitles;
    for (int i = 0; i < buttonTitles.count; i++) {
        UIButton *button = [self _buttonWithTitle:[buttonTitles objectAtIndex:i]];
        [button setTag:i + 1];
        [self addSubview:button];
    }
}

#pragma mark - Private methods
- (UIButton*)_buttonWithTitle:(NSString*)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(0, 0, self.frame.size.width, self.buttonHeight)];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

#pragma mark - Button Actions
- (void)buttonSelected:(UIButton*)button {
    NSLog(@"%@",button);
}

@end
