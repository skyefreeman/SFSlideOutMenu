//
//  SFSlideOutMenuTests.m
//  SFSlideOutMenu
//
//  Created by Skye on 1/9/16.
//  Copyright © 2016 Skye. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
@import SFSlideOutMenu;

SpecBegin(Variables)

__block SFSlideOutMenu *menu;
__block UIButton *firstButton;
__block UIButton *secondButton;

beforeEach(^{
    menu = [[SFSlideOutMenu alloc] initWithFrame:CGRectMake(0, 0, 50, 200)];
    [menu setButtonTitles:@[@"one",@"two"]];
    firstButton = menu.subviews[0];
    secondButton = menu.subviews[1];
});

describe(@"buttonSpacing", ^{
    
    it(@"defaults to 0.0", ^{
        expect(menu.buttonSpacing).to.equal(0.0);
    });
    
    it(@"lays out subviews with spaces when set", ^{
        menu.buttonSpacing = 10.0;
        expect(menu.subviews.firstObject.frame.origin.y).to.equal(10.0);
    });
});

describe(@"buttonHeight", ^{
    it(@"defaults to 50.0", ^{
        expect(menu.buttonHeight).to.equal(50.0);
    });
    
    it(@"lays out subviews when set", ^{
        [menu setButtonHeight:15.0];
        expect(menu.subviews.firstObject.frame.size.height).to.equal(15.0);
    });
});

describe(@"buttonTitles", ^{
    it(@"defaults to nil", ^{
        SFSlideOutMenu *testMenu = [[SFSlideOutMenu alloc] initWithFrame:CGRectZero];
        expect(testMenu.buttonTitles).to.beNil;
    });
    
    it(@"creates buttons when set", ^{
        expect(menu.subviews.firstObject).to.beKindOf([UIButton class]);
    });
    
    it(@"adds button titles when set", ^{
        expect(firstButton.titleLabel.text).to.match(@"one");
        expect(secondButton.titleLabel.text).to.match(@"two");
    });
});

describe(@"buttonWidth", ^{
    it(@"defaults to the menu width", ^{
        expect(menu.buttonWidth).to.equal(50.0);
    });
    
    it(@"lays out button subviews with new width", ^{
        menu.buttonWidth = 30;
        expect(menu.subviews.firstObject.frame.size.width).to.equal(30.0);
    });
});

describe(@"buttonCornerRadius", ^{
    it(@"defaults to 0.0", ^{
        expect(menu.buttonCornerRadius).to.equal(0.0);
    });
    
    it(@"lays out button subviews with new corner radius when set", ^{
        menu.buttonCornerRadius = 3.0;
        expect(menu.subviews.firstObject.layer.cornerRadius).to.equal(3.0);
    });
});

describe(@"buttonBackgroundColor", ^{
    it(@"defaults to clear", ^{
        expect(menu.buttonBackgroundColor).to.equal([UIColor clearColor]);
    });
    
    it(@"lays out button subviews with new colors when set", ^{
        menu.buttonBackgroundColor = [UIColor redColor];
        expect(menu.subviews.firstObject.backgroundColor).to.equal([UIColor redColor]);
    });
});

describe(@"buttonTitleColor", ^{
    it(@"defaults to black", ^{
        expect(menu.buttonTitleColor).to.equal([UIColor blackColor]);
    });
    
    it(@"lays out button subviews with new title colors when set", ^{
        menu.buttonTitleColor = [UIColor redColor];
        expect([firstButton titleColorForState:UIControlStateNormal]).to.equal([UIColor redColor]);
    });
});

describe(@"buttonFont", ^{
    it(@"defaults to system size 16", ^{
        UIFont *font = [UIFont systemFontOfSize:16];
        expect(menu.buttonFont).to.equal(font);
        
        [menu layoutIfNeeded];
        expect(firstButton.titleLabel.font).to.equal(font);
    });
    
    it(@"lays out button subviews with new font when set", ^{
        menu.buttonFont = [UIFont systemFontOfSize:20];
        expect(firstButton.titleLabel.font).to.equal([UIFont systemFontOfSize:20]);
    });
});

describe(@"animationDuration", ^{
    it(@"defaults to 0.5", ^{
        expect(menu.animationDuration).to.equal(0.5);
    });
    
});
SpecEnd

SpecBegin(Buttons)

describe(@"Each button", ^{
    it(@"is centered", ^{
        SFSlideOutMenu *menu = [[SFSlideOutMenu alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
        [menu setButtonTitles:@[@"Button"]];
        [menu setButtonWidth:5];
        
        UIButton *button = menu.subviews.firstObject;
        expect(button.frame.origin.x).to.equal(2.5);
    });
});

SpecEnd

SpecBegin(Animation)

describe(@"toggleActive", ^{
    __block SFSlideOutMenu *menu;
    
    beforeEach(^{
        menu = [[SFSlideOutMenu alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    });
    
    it(@"moves left by the width of the menu when toggled as 'inactive' ", ^{
        [menu toggleActive];
        expect(menu.frame.origin.x).after(menu.animationDuration).to.equal(0);
    });
    
    it(@"moves right by the width of the menu when toggled as 'active' ", ^{
        [menu toggleActive];
        [menu toggleActive];
        expect(menu.frame.origin.x).after(menu.animationDuration).to.equal(10);
    });
});

SpecEnd