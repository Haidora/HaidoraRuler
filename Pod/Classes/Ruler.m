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
    else if (nativeWidth == 1080)
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

@property (nonatomic, copy) id classic;
@property (nonatomic, copy) id bigger;
@property (nonatomic, copy) id biggerPlus;

@end

@interface _RuleriPhoneVertical : Ruler

@property (nonatomic, copy) id classicInch35;
@property (nonatomic, copy) id classicInch4;
@property (nonatomic, copy) id bigger;
@property (nonatomic, copy) id biggerPlus;

@end

@interface _RuleriPhone : Ruler

@property (nonatomic, copy) id iPhone4_s;
@property (nonatomic, copy) id iPhone5_s;
@property (nonatomic, copy) id iPhone6_s;
@property (nonatomic, copy) id iPhone6Plus_s;

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

+ (Ruler<id> * (^)())iPhoneHorizontal
{
    return ^Ruler *(id classic, id bigger, id biggerPlus)
    {
        return [Ruler iPhoneHorizontal:classic, bigger, biggerPlus, nil];
    };
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

+ (Ruler<id> * (^)())iPhoneVertical
{
    return ^Ruler *(id classicInch35, id classicInch4, id bigger, id biggerPlus)
    {
        return [Ruler iPhoneVertical:classicInch35, classicInch4, bigger, biggerPlus, nil];
    };
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

+ (Ruler<id> * (^)())iPhone
{
    return ^Ruler *(id iPhone4_s, id iPhone5_s, id iPhone6_s, id iPhone6Plus_s)
    {
        return [Ruler iPhone:iPhone4_s, iPhone5_s, iPhone6_s, iPhone6Plus_s, nil];
    };
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

    id value;
    switch (model)
    {
    case DeviceModel_iPhone4_s:
    case DeviceModel_iPhone5_s:
    {
        value = self.classic;
    }
    break;
    case DeviceModel_iPhone6_s:
    {
        value = self.bigger;
    }
    break;
    case DeviceModel_iPhone6Plus_s:
    {
        value = self.biggerPlus;
    }
    break;
    default:
        break;
    }
    return value ?: self.classic;
}

@end

@implementation _RuleriPhoneVertical

- (id)value
{
    DeviceModel model = getCurrentDeviceModel();

    id value;
    switch (model)
    {
    case DeviceModel_iPhone4_s:
    {
        value = self.classicInch35;
    }
    break;
    case DeviceModel_iPhone5_s:
    {
        value = self.classicInch4;
    }
    break;
    case DeviceModel_iPhone6_s:
    {
        value = self.bigger;
    }
    break;
    case DeviceModel_iPhone6Plus_s:
    {
        value = self.biggerPlus;
    }
    break;
    default:
        break;
    }
    return value ?: self.classicInch35;
}

@end

@implementation _RuleriPhone

- (id)value
{
    DeviceModel model = getCurrentDeviceModel();

    id value;
    switch (model)
    {
    case DeviceModel_iPhone4_s:
    {
        value = self.iPhone4_s;
    }
    break;
    case DeviceModel_iPhone5_s:
    {
        value = self.iPhone5_s;
    }
    break;
    case DeviceModel_iPhone6_s:
    {
        value = self.iPhone6_s;
    }
    break;
    case DeviceModel_iPhone6Plus_s:
    {
        value = self.iPhone6Plus_s;
    }
    break;
    default:
        break;
    }
    return value ?: self.iPhone4_s;
}

@end