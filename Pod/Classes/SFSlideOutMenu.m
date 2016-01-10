//
//  SFSlideOutMenu.m
//  Pods
//
//  Created by Skye on 1/9/16.
//
//

#import "SFSlideOutMenu.h"

@interface SFSlideOutMenu()
@property (nonatomic, getter=isActive) BOOL active;
@end

@implementation SFSlideOutMenu

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) return nil;

    self.buttonSpacing = 0;
    self.buttonCornerRadius = 0;
    self.buttonHeight = 50;
    self.buttonWidth = frame.size.width;
    self.buttonBackgroundColor = [UIColor clearColor];
    self.buttonTitleColor = [UIColor blackColor];
    self.buttonFont = [UIFont systemFontOfSize:16];
    
    self.animationDuration = 0.5;
    
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
        [button setBackgroundColor:self.buttonBackgroundColor];
        [button setTitleColor:self.buttonTitleColor forState:UIControlStateNormal];
        [button.titleLabel setFont:self.buttonFont];
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

- (void)setButtonBackgroundColor:(UIColor *)buttonBackgroundColor {
    _buttonBackgroundColor = buttonBackgroundColor;
    [self layoutSubviews];
}

- (void)setButtonTitleColor:(UIColor *)buttonTitleColor {
    _buttonTitleColor = buttonTitleColor;
    [self layoutSubviews];
}

- (void)setButtonFont:(UIFont *)buttonFont {
    _buttonFont = buttonFont;
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

#pragma mark - Public Methods
- (void)toggleActive {
    CGPoint origin = self.frame.origin;
    CGSize size = self.frame.size;
    CGFloat newY = (self.isActive) ? (origin.x + size.width) : (origin.x - size.width);

    self.active = (self.active) ? NO : YES;
    
    [UIView animateWithDuration:self.animationDuration animations:^{
        self.frame = CGRectMake(newY, origin.y, size.width, size.height);
    }];
}

#pragma mark - Private Methods
- (UIButton*)_buttonWithTitle:(NSString*)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(_buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)_buttonSelected:(UIButton*)button {
    NSLog(@"%@",button);
}

@end
