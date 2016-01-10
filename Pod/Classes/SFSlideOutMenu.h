//
//  SFSlideOutMenu.h
//  Pods
//
//  Created by Skye on 1/9/16.
//
//

#import <UIKit/UIKit.h>


@interface SFSlideOutMenu : UIWindow

@property (nonatomic) CGFloat buttonSpacing;
@property (nonatomic) CGFloat buttonCornerRadius;
@property (nonatomic) CGFloat buttonHeight;
@property (nonatomic) CGFloat buttonWidth;
@property (nonatomic) UIColor *buttonBackgroundColor;
@property (nonatomic) UIColor *buttonTitleColor;
@property (nonatomic) UIFont *buttonFont;

@property (nonatomic) CGFloat animationDuration;
// Animation time
// Header
// Footer
// ScrollView

@property (nonatomic, copy) NSArray *buttonTitles;

- (void)toggleActive;

@end
