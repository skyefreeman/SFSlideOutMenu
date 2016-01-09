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
    
    self.windowLevel = UIWindowLevelStatusBar;
    self.hidden = NO;
    
    return self;
}

#pragma mark - Method Overrides
- (void)layoutSubviews {
    CGFloat currentOriginHeight = self.spacing;
    for (UIView *view in self.subviews) {
        [view setBackgroundColor:[UIColor whiteColor]];
        [view setFrame:CGRectMake(0, currentOriginHeight, view.frame.size.width, view.frame.size.height)];
        currentOriginHeight += view.frame.size.height + self.spacing;
    }
}

- (void)setSpacing:(CGFloat)spacing {
    _spacing = spacing;
    [self layoutSubviews];
}

- (void)setButtonTitles:(NSArray *)buttonTitles {
    for (NSString *title in buttonTitles) {
        
    }
}
#pragma mark - 

@end
