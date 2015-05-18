//
//  FWCalendarHeader.m
//  MyCalendarPlayGround
//
//  Created by fanwu on 15/5/18.
//  Copyright (c) 2015年 ND. All rights reserved.
//

#import "FWCalendarHeader.h"
#import <Masonry/Masonry.h>
#import "NSDate+FSExtension.h"

@implementation FWCalendarHeader

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize{
    _dateFormat = @"yyyy年M月";
    _dateFormatter = [NSDateFormatter new];
    _dateFormatter.dateFormat = _dateFormat;
    
    self.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
    
    self.titleLabel = [UILabel new];
    self.titleLabel .textAlignment = NSTextAlignmentCenter;
    NSDate * date = [NSDate date];
    self.titleLabel .text = [_dateFormatter stringFromDate:date];
    self.titleLabel .textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.87];
    self.titleLabel .font = [UIFont systemFontOfSize:13];
    [self addSubview:self.titleLabel ];
    [self.titleLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.lessThanOrEqualTo(self);
        make.bottom.lessThanOrEqualTo(self);
        make.width.lessThanOrEqualTo(@200);
        make.center.equalTo(self);
    }];
    
    UIButton * left = [UIButton buttonWithType:UIButtonTypeCustom];
    [left setImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
    [left addTarget:self action:@selector(doLeft:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:left];
    [left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@15);
        make.height.equalTo(@15);
        make.left.equalTo(self).offset(36);
        make.centerY.equalTo(self);
    }];
    
    
    UIButton * right = [UIButton buttonWithType:UIButtonTypeCustom];
    [right setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [right addTarget:self action:@selector(doRight:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:right];
    [right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@15);
        make.height.equalTo(@15);
        make.right.equalTo(self).offset(-36);
        make.centerY.equalTo(self);
    }];
}

- (IBAction)doLeft:(id)sender{
    NSDate * month = self.calendar.currentMonth;
    NSDate * prevMonth = [month fs_dateBySubtractingMonths:1];
    
    [self.calendar setCurrentMonth:prevMonth animate:YES];
    self.titleLabel.text = [_dateFormatter stringFromDate:prevMonth];
}

- (IBAction)doRight:(id)sender{
    NSDate * date = self.calendar.currentMonth;
    NSDate * nextMonth = [date fs_dateByAddingMonths:1];
    [self.calendar setCurrentMonth:nextMonth animate:YES];
    self.titleLabel.text = [_dateFormatter stringFromDate:nextMonth];
}
@end
