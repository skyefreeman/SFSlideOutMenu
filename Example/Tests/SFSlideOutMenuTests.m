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

describe(@"Spacing variable ", ^{
    __block SFSlideOutMenu *menu;
    
    beforeEach(^{
        menu = [[SFSlideOutMenu alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
    });
    
    it(@"should default to 0.0", ^{
        expect(menu.spacing).to.equal(0.0);
    });
    
    it(@"setting should layout subviews with spaces", ^{
        [menu addSubview:[[UIView alloc] initWithFrame:CGRectZero]];
        menu.spacing = 10.0;
        expect(menu.subviews.firstObject.frame.origin.y).to.equal(10.0);
    });
});

SpecEnd