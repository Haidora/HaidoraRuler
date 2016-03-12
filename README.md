# HaidoraRuler

[![CI Status](http://img.shields.io/travis/mrdaios/HaidoraRuler.svg?style=flat)](https://travis-ci.org/mrdaios/HaidoraRuler)
[![Version](https://img.shields.io/cocoapods/v/HaidoraRuler.svg?style=flat)](http://cocoapods.org/pods/HaidoraRuler)
[![License](https://img.shields.io/cocoapods/l/HaidoraRuler.svg?style=flat)](http://cocoapods.org/pods/HaidoraRuler)
[![Platform](https://img.shields.io/cocoapods/p/HaidoraRuler.svg?style=flat)](http://cocoapods.org/pods/HaidoraRuler)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Example


```
Ruler<NSNumber *> *width = [Ruler<NSNumber *> iPhoneHorizontal:@(10), @(20), @(30), nil];
Ruler<NSNumber *> *height = [Ruler iPhoneVertical:@(5), @(10), @(20), @(30), nil];
NSLog(@"width:%@ height:%@", width.value, height);

Ruler<UIFont *> *font = [Ruler<UIFont *> iPhone:[UIFont systemFontOfSize:12], [UIFont systemFontOfSize:14], [UIFont systemFontOfSize:16], [UIFont systemFontOfSize:18], nil];
NSLog(@"font:%@", font.value);
```



## Installation

HaidoraRuler is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "HaidoraRuler"
```

## Inspired by these projects:
* [Ruler](https://github.com/nixzhu/Ruler)

## Author

mrdaios, mrdaios@gmail.com

## License

HaidoraRuler is available under the MIT license. See the LICENSE file for more info.
