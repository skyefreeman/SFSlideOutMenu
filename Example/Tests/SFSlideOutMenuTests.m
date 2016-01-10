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

beforeEach(^{
    menu = [[SFSlideOutMenu alloc] initWithFrame:CGRectMake(0, 0, 50, 200)];
    [menu setButtonTitles:@[@"one",@"two"]];
});

describe(@"buttonSpacing", ^{
    
    it(@"defaults to 0.0", ^{
        expect(menu.buttonSpacing).to.equal(0.0);
    });
    
    it(@"lays out subviews with spaces when setting", ^{
        menu.buttonSpacing = 10.0;
        expect(menu.subviews.firstObject.frame.origin.y).to.equal(10.0);
    });
});

describe(@"buttonHeight", ^{
    it(@"defaults to 50.0", ^{
        expect(menu.buttonHeight).to.equal(50.0);
    });
    
    it(@"lays out subviews when setting", ^{
        [menu setButtonHeight:15.0];
        expect(menu.subviews.firstObject.frame.size.height).to.equal(15.0);
    });
});

describe(@"buttonTitles", ^{
    it(@"defaults to nil", ^{
        SFSlideOutMenu *testMenu = [[SFSlideOutMenu alloc] initWithFrame:CGRectZero];
        expect(testMenu.buttonTitles).to.beNil;
    });
    
    it(@"creates buttons when setting", ^{
        expect(menu.subviews.firstObject).to.beKindOf([UIButton class]);
    });
    
    it(@"sets button titles when setting", ^{
        UIButton *firstButton = menu.subviews[0];
        expect(firstButton.titleLabel.text).to.match(@"one");
        
        UIButton *secondButton = menu.subviews[1];
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
    
    it(@"lays out button subviews with new corner radius when setting", ^{
        menu.buttonCornerRadius = 3.0;
        expect(menu.subviews.firstObject.layer.cornerRadius).to.equal(3.0);
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
