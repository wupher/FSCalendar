//
//  FWCalendarHeader.h
//  MyCalendarPlayGround
//
//  Created by fanwu on 15/5/18.
//  Copyright (c) 2015年 ND. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSCalendar.h"
@interface FWCalendarHeader : UIView<FSCalendarDelegate>
@property(copy, nonatomic) NSString * dateFormat;
@property (strong, nonatomic) UILabel * titleLabel;
@property (weak, nonatomic) FSCalendar * calendar;
@property (copy, nonatomic) NSDateFormatter * dateFormatter;

@end
