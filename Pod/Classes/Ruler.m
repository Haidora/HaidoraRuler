//
//  Ruler.m
//
//  Created by mrdaios on 16/3/12.
//  Copyright © 2016年 Haidora. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "Ruler.h"
#import <UIKit/UIKit.h>

inline static DeviceModel getCurrentDeviceModel()
{
    UIScreen *mainScreen = [UIScreen mainScreen];
    DeviceModel deviceModel;
    CGFloat nativeWidth = mainScreen.nativeBounds.size.width;
    if (2 * 320 == nativeWidth)
    {
        deviceModel = mainScreen.nativeBounds.size.height > (2 * 480) ? DeviceModel_iPhone5_s
                                                                      : DeviceModel_iPhone4_s;
    }
    else if (2 * 375 == nativeWidth)
    {
        deviceModel = DeviceModel_iPhone6_s;
    }
    else if (3 * 414 == nativeWidth)
    {
        deviceModel = DeviceModel_iPhone6Plus_s;
    }
    else
    {
        NSLog(@"Warning: not support idevice!");
        deviceModel = DeviceModel_iPhone4_s;
    }
    return deviceModel;
}

@interface _RuleriPhoneHorizontal : Ruler

@property (nonatomic, strong) id classic;
@property (nonatomic, strong) id bigger;
@property (nonatomic, strong) id biggerPlus;

@end

@interface _RuleriPhoneVertical : Ruler

@property (nonatomic, strong) id classicInch35;
@property (nonatomic, strong) id classicInch4;
@property (nonatomic, strong) id bigger;
@property (nonatomic, strong) id biggerPlus;

@end

@interface _RuleriPhone : Ruler

@property (nonatomic, strong) id iPhone4_s;
@property (nonatomic, strong) id iPhone5_s;
@property (nonatomic, strong) id iPhone6_s;
@property (nonatomic, strong) id iPhone6Plus_s;

@end

@implementation Ruler

+ (instancetype)iPhoneHorizontal:(id)classic, ...
{
    _RuleriPhoneHorizontal *ruler = [[_RuleriPhoneHorizontal alloc] init];
    ruler.classic = classic;

    id eachObj;
    va_list args;
    va_start(args, classic);
    while ((eachObj = va_arg(args, id)))
    {
        if (nil == ruler.bigger)
        {
            ruler.bigger = eachObj;
        }
        else if (nil == ruler.biggerPlus)
        {
            ruler.biggerPlus = eachObj;
        }
    }
    va_end(args);
    return ruler;
}

+ (instancetype)iPhoneVertical:(id)classicInch35, ...
{
    _RuleriPhoneVertical *ruler = [[_RuleriPhoneVertical alloc] init];
    ruler.classicInch35 = classicInch35;

    id eachObj;
    va_list args;
    va_start(args, classicInch35);
    while ((eachObj = va_arg(args, id)))
    {
        if (nil == ruler.classicInch4)
        {
            ruler.classicInch4 = eachObj;
        }
        else if (nil == ruler.bigger)
        {
            ruler.bigger = eachObj;
        }
        else if (nil == ruler.biggerPlus)
        {
            ruler.biggerPlus = eachObj;
        }
    }
    va_end(args);
    return ruler;
}

+ (instancetype)iPhone:(id)iPhone4_s, ...
{
    _RuleriPhone *ruler = [[_RuleriPhone alloc] init];
    ruler.iPhone4_s = iPhone4_s;

    id eachObj;
    va_list args;
    va_start(args, iPhone4_s);
    while ((eachObj = va_arg(args, id)))
    {
        if (nil == ruler.iPhone5_s)
        {
            ruler.iPhone5_s = eachObj;
        }
        else if (nil == ruler.iPhone6_s)
        {
            ruler.iPhone6_s = eachObj;
        }
        else if (nil == ruler.iPhone6Plus_s)
        {
            ruler.iPhone6Plus_s = eachObj;
        }
    }
    va_end(args);
    return ruler;
}

- (id)value
{
    NSLog(@"subClass need override");
    return nil;
}

@end

@implementation _RuleriPhoneHorizontal

- (id)value
{
    DeviceModel model = getCurrentDeviceModel();
    switch (model)
    {
    case DeviceModel_iPhone4_s:
    case DeviceModel_iPhone5_s:
    {
        return self.classic;
    }
    break;
    case DeviceModel_iPhone6_s:
    {
        return self.bigger;
    }
    break;
    case DeviceModel_iPhone6Plus_s:
    {
        return self.biggerPlus;
    }
    break;
    default:
    {
        return self.classic;
    }
    break;
    }
}

@end

@implementation _RuleriPhoneVertical

- (id)value
{
    DeviceModel model = getCurrentDeviceModel();
    switch (model)
    {
    case DeviceModel_iPhone4_s:
    {
        return self.classicInch35;
    }
    break;
    case DeviceModel_iPhone5_s:
    {
        return self.classicInch4;
    }
    break;
    case DeviceModel_iPhone6_s:
    {
        return self.bigger;
    }
    break;
    case DeviceModel_iPhone6Plus_s:
    {
        return self.biggerPlus;
    }
    break;
    default:
    {
        return self.classicInch35;
    }
    break;
    }
}

@end

@implementation _RuleriPhone

- (id)value
{
    DeviceModel model = getCurrentDeviceModel();
    switch (model)
    {
    case DeviceModel_iPhone4_s:
    {
        return self.iPhone4_s;
    }
    break;
    case DeviceModel_iPhone5_s:
    {
        return self.iPhone5_s;
    }
    break;
    case DeviceModel_iPhone6_s:
    {
        return self.iPhone6_s;
    }
    break;
    case DeviceModel_iPhone6Plus_s:
    {
        return self.iPhone6Plus_s;
    }
    break;
    default:
    {
        return self.iPhone4_s;
    }
    break;
    }
}

@end