//
//  HDViewController.m
//  HaidoraRuler
//
//  Created by mrdaios on 03/12/2016.
//  Copyright (c) 2016 mrdaios. All rights reserved.
//

#import "HDViewController.h"
#import <HaidoraRuler/Ruler.h>

@interface HDViewController ()

@end

@implementation HDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //泛型建议传对象
    Ruler<NSNumber *> *width = [Ruler<NSNumber *> iPhoneHorizontal:@(10), @(20), @(30), nil];
    Ruler<NSNumber *> *height = [Ruler iPhoneVertical:@(5), @(10), @(20), @(30), nil];
    NSLog(@"width:%@ height:%@", width.value, height);

    Ruler<UIFont *> *font =
        [Ruler<UIFont *> iPhone:[UIFont systemFontOfSize:12], [UIFont systemFontOfSize:14],
                                [UIFont systemFontOfSize:16], [UIFont systemFontOfSize:18], nil];
    NSLog(@"font:%@", font.value);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
