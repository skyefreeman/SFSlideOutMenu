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
    firstButton = menu.container.subviews[0];
    secondButton = menu.container.subviews[1];

});

describe(@"buttonSpacing", ^{
    it(@"defaults to 0.0", ^{
        expect(menu.buttonSpacing).to.equal(0.0);
    });
    
    it(@"lays out subviews with spaces when set", ^{
        menu.buttonSpacing = 10.0;
        [menu layoutIfNeeded];
        expect(firstButton.frame.origin.y).to.equal(10.0);
    });
});

describe(@"buttonHeight", ^{
    it(@"defaults to 50.0", ^{
        expect(menu.buttonHeight).to.equal(50.0);
    });
    
    it(@"lays out subviews when set", ^{
        [menu setButtonHeight:15.0];
        [menu layoutIfNeeded];
        expect(firstButton.frame.size.height).to.equal(15.0);
    });
});

describe(@"buttonTitles", ^{
    it(@"defaults to nil", ^{
        SFSlideOutMenu *testMenu = [[SFSlideOutMenu alloc] initWithFrame:CGRectZero];
        expect(testMenu.buttonTitles).to.beNil;
    });
    
    it(@"creates buttons when set", ^{
        expect(firstButton).notTo.beNil;
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
        [menu layoutIfNeeded];
        expect(firstButton.frame.size.width).to.equal(30.0);
    });
});

describe(@"buttonCornerRadius", ^{
    it(@"defaults to 0.0", ^{
        expect(menu.buttonCornerRadius).to.equal(0.0);
    });
    
    it(@"lays out button subviews with new corner radius when set", ^{
        menu.buttonCornerRadius = 3.0;
        [menu layoutIfNeeded];
        expect(firstButton.layer.cornerRadius).to.equal(3.0);
    });
});

describe(@"buttonBackgroundColor", ^{
    it(@"defaults to clear", ^{
        expect(menu.buttonBackgroundColor).to.equal([UIColor clearColor]);
    });
    
    it(@"lays out button subviews with new colors when set", ^{
        menu.buttonBackgroundColor = [UIColor redColor];
        [menu layoutIfNeeded];
        expect(firstButton.backgroundColor).to.equal([UIColor redColor]);
    });
});

describe(@"buttonTitleColor", ^{
    it(@"defaults to black", ^{
        expect(menu.buttonTitleColor).to.equal([UIColor blackColor]);
    });
    
    it(@"lays out button subviews with new title colors when set", ^{
        menu.buttonTitleColor = [UIColor redColor];
        [menu layoutIfNeeded];
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
        [menu layoutIfNeeded];
        expect(firstButton.titleLabel.font).to.equal([UIFont systemFontOfSize:20]);
    });
});

describe(@"animationDuration", ^{
    it(@"defaults to 0.5", ^{
        expect(menu.animationDuration).to.equal(0.5);
    });
    
});

describe(@"headerView", ^{
    __block UIView *header;

    beforeEach(^{
        header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    });
    
    it(@"defaults to nil", ^{
        expect(menu.headerView).to.beNil;
    });

    it(@"adds a view to the window when set", ^{
        menu.headerView = header;
        expect(menu.headerView.frame.origin).to.equal(CGPointZero);
        expect(menu.headerView.superview).to.equal(menu.container);
    });
    
    it(@"lays out buttons below header", ^{
        menu.headerView = header;
        [menu layoutIfNeeded];
        expect(firstButton.frame.origin.y).to.equal(menu.headerView.frame.size.height);
    });
});

describe(@"footerView", ^{
    it(@"defaults to nil", ^{
        expect(menu.footerView).to.beNil;
    });
    
    it(@"adds a view to the bottom of the the view", ^{
        menu.footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        expect(menu.footerView.frame.origin.y).to.equal(menu.frame.size.height - menu.footerView.frame.size.height);
        expect(menu.footerView.superview).to.equal(menu.container);
    });
});

describe(@"style", ^{
    it(@"defaults to 0", ^{
        expect(menu.style).to.equal(SFSlideOutMenuStyleRight);
    });
});
SpecEnd

SpecBegin(Buttons)

describe(@"Each button", ^{
    it(@"is centered", ^{
        SFSlideOutMenu *menu = [[SFSlideOutMenu alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
        [menu setButtonTitles:@[@"Button"]];
        [menu setButtonWidth:5];
        
        UIButton *button = menu.container.subviews.firstObject;
        [menu layoutIfNeeded];
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
        expect(menu.container.frame.origin.x).after(menu.animationDuration).to.equal(0);
    });
    
    it(@"moves right by the width of the menu when toggled as 'active' ", ^{
        [menu toggleActive];
        [menu toggleActive];
        expect(menu.frame.origin.x).after(menu.animationDuration).to.equal(10);
    });
});

SpecEnd