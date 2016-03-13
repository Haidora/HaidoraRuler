//
//  Ruler.h
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

#import <Foundation/Foundation.h>

/**
 *  iDevices
 */
typedef NS_ENUM(NSInteger, DeviceModel) {
    DeviceModel_iPhone4_s,
    DeviceModel_iPhone5_s,
    DeviceModel_iPhone6_s,
    DeviceModel_iPhone6Plus_s,
};

@interface Ruler <__covariant ObjectType> : NSObject

/**
 *  Ruler of iPhoneHorizontal.
 *
 *  @param classic iPhone4_s,iphone5_s
 *  @param Biggert iPhone6_s (if not set return classic.)
 *  @param BiggerPlus iPhone6Plus_s (if not set return classic.)
 */
+ (Ruler<ObjectType> *)iPhoneHorizontal:(ObjectType)classic, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *  Ruler of iPhoneHorizontal.
 *
 *  @param classic iPhone4_s,iphone5_s
 *  @param Biggert iPhone6_s (if not set return classic.)
 *  @param BiggerPlus iPhone6Plus_s (if not set return classic.)
 */
+ (Ruler<ObjectType> * (^)())iPhoneHorizontal;

/**
 *  Ruler of iPhoneVertical.
 *
 *  @param classicInch35 iPhone4_s
 *  @param classicInch4 iPhone5_s (if not set return classicInch35.)
 *  @param Biggert iPhone6_s (if not set return classicInch35.)
 *  @param BiggerPlus iPhone6Plus (if not set return classicInch35.)
 */
+ (Ruler<ObjectType> *)iPhoneVertical:(ObjectType)classicInch35, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *  Ruler of iPhoneVertical.
 *
 *  @param classicInch35 iPhone4_s
 *  @param classicInch4 iPhone5_s (if not set return classicInch35.)
 *  @param Biggert iPhone6_s (if not set return classicInch35.)
 *  @param BiggerPlus iPhone6Plus (if not set return classicInch35.)
 */
+ (Ruler<ObjectType> * (^)())iPhoneVertical;

/**
 *  Ruler of iPhone
 *
 *  @param iPhone4_s iPhone4_s
 *  @param iPhone5_s iPhone5_s (if not set return classicInch35.)
 *  @param iPhone6_s iPhone6_s (if not set return classicInch35.)
 *  @param iPhone6Plus_s iPhone6Plus_s (if not set return classicInch35.)
 */
+ (Ruler<ObjectType> *)iPhone:(ObjectType)iPhone4_s, ... NS_REQUIRES_NIL_TERMINATION;

/**
 *  Ruler of iPhone
 *
 *  @param iPhone4_s iPhone4_s
 *  @param iPhone5_s iPhone5_s (if not set return classicInch35.)
 *  @param iPhone6_s iPhone6_s (if not set return classicInch35.)
 *  @param iPhone6Plus_s iPhone6Plus_s (if not set return classicInch35.)
 */
+ (Ruler<ObjectType> * (^)())iPhone;

/**
 *  Value for different sizes of iOS devices.
 *
 */
- (ObjectType)value;

@end
