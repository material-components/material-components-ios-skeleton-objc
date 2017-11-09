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

#import "AppTabbedViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

#import <MaterialComponents/MaterialAppBar.h>

@interface AppTabbedViewController ()
@property(nonatomic, strong) MDCAppBar *appBar;
@end

@implementation AppTabbedViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.appBar = [[MDCAppBar alloc] init];
  [self addChildViewController:self.appBar.headerViewController];
  [self.appBar addSubviewsToParent];
  [self.appBar.headerViewController didMoveToParentViewController:self];

  self.viewControllers = @[[[FirstViewController alloc] initWithNibName:nil bundle:nil],
                           [[SecondViewController alloc] initWithNibName:nil bundle:nil]];
  self.selectedViewController = self.viewControllers.firstObject;

  self.view.backgroundColor = UIColor.whiteColor;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
  return nil;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}

#pragma mark - MDCTabBarViewController overrides

- (void)setSelectedViewController:(UIViewController *)selectedViewController {
  [super setSelectedViewController:selectedViewController];
  
  // Need to update the AppBar with the tab's information
  [self.appBar.navigationBar observeNavigationItem:selectedViewController.navigationItem];

  // Required to ensure that the AppBar will always be the frontmost view
  [self.view bringSubviewToFront:self.appBar.headerViewController.view];
}

@end
