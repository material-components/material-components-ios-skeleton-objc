/*
 Copyright 2017-present the Material Components for iOS authors. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "SecondViewController.h"
#import <MaterialComponents/MaterialButtons.h>
#import <MaterialComponents/MaterialFeatureHighlight.h>

@interface SecondViewController ()
@property(nonatomic, strong) MDCButton *button;
@end

@implementation SecondViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithRed:1 green:(CGFloat)0.9 blue:(CGFloat)0.9 alpha:1];
  self.tabBarItem.title = @"Second";
  self.title = @"Second";

  self.button = [[MDCRaisedButton alloc] initWithFrame:CGRectZero];
  [self.button setTitle:@"Hello" forState:UIControlStateNormal];
  [self.button addTarget:self
                  action:@selector(buttonDidTap:)
        forControlEvents:UIControlEventTouchUpInside];
  self.button.translatesAutoresizingMaskIntoConstraints = NO;
  [self.view addSubview:self.button];

  NSLayoutConstraint *centerXConstraint =
      [self.button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];
  NSLayoutConstraint *centerYConstraint =
      [self.button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor];
  #if defined(__IPHONE_11_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_11_0)
  if (@available(iOS 11.0, *)) {
    centerXConstraint = [self.button.centerXAnchor
                            constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerXAnchor];

    centerYConstraint = [self.button.centerYAnchor
                            constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerYAnchor];
  }
  #endif
  centerXConstraint.active = YES;
  centerYConstraint.active = YES;
}

- (void)buttonDidTap:(id)sender {
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  // This check is required because MDCTabBarViewController will add us to the view hierarchy
  // in a hidden state before the associated tab is tapped.
  if (self.view.isHidden) {
    return;
  }
  static BOOL isFeatureHighlightAlreadyDisplayed = NO;
  if (!isFeatureHighlightAlreadyDisplayed) {
    MDCFeatureHighlightViewController *featureHighlightController =
        [[MDCFeatureHighlightViewController alloc] initWithHighlightedView:_button completion:nil];
    featureHighlightController.mdc_adjustsFontForContentSizeCategory = YES;
    featureHighlightController.outerHighlightColor = [UIColor colorWithRed:0.9
                                                                     green:(CGFloat)0.7
                                                                      blue:(CGFloat)0.7
                                                                     alpha:0.8];
    featureHighlightController.titleText = @"Hello, world!";
    featureHighlightController.bodyText =
        @"Feature Highlight spotlights a part of the screen to introduce new features.";
    [self presentViewController:featureHighlightController animated:YES completion:^{
      isFeatureHighlightAlreadyDisplayed = YES;
    }];
  }

}

@end
