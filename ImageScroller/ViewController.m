//
//  ViewController.m
//  ImageScroller
//
//  Created by ihub on 16/10/18.
//  Copyright © 2018 ecoihub. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <KIImagePagerDelegate, KIImagePagerDataSource>

{
    IBOutlet KIImagePager *_imagePager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _imagePager.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    _imagePager.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    _imagePager.slideshowTimeInterval = 5.5f;
    _imagePager.slideshowShouldCallScrollToDelegate = YES;
}

#pragma mark - KIImagePager DataSource
- (NSArray *) arrayWithImages:(KIImagePager*)pager
{
    return @[
             [UIImage imageNamed:@"1"],
             [UIImage imageNamed:@"2"],
             [UIImage imageNamed:@"3"]
             ];
}

- (UIViewContentMode) contentModeForImage:(NSUInteger)image inPager:(KIImagePager *)pager
{
    return UIViewContentModeScaleAspectFill;
}

- (NSString *) captionForImageAtIndex:(NSInteger)index inPager:(KIImagePager *)pager
{
    return @[
             @"First screenshot",
             @"Another screenshot",
             @"Last one! ;-)"
             ][index];
}

#pragma mark - KIImagePager Delegate
- (void) imagePager:(KIImagePager *)imagePager didScrollToIndex:(NSUInteger)index
{
    NSLog(@"%s %lu", __PRETTY_FUNCTION__, (unsigned long)index);
}

- (void) imagePager:(KIImagePager *)imagePager didSelectImageAtIndex:(NSUInteger)index
{
    NSLog(@"%s %lu", __PRETTY_FUNCTION__, (unsigned long)index);
}


@end
