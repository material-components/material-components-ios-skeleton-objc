# MDC iOS Tab-based Seed Application

This repository contains a template and sample code that you can use to seed a new Material Design
Components (MDC) application for iOS.  It's a simple application that provides a
[bottom Tab bar](https://material.io/components/ios/catalog/tabs/),
[a top AppBar](https://material.io/components/ios/catalog/app-bars/), and two simple view controllers
[including a Button](https://material.io/components/ios/catalog/buttons/) and
[Feature Highlights](https://material.io/components/ios/catalog/feature-highlights/).

## How to use this project
1. Fork this repository on GitHub
  * You can also check it out and push it elsewhere
1. Run `pod install` in the project directory to install the dependencies and then open in Xcode
    ```bash
    git clone https://github.com/material-components/material-components-ios-skeleton-objc.git my-app
    cd my-app
    pod install
    open ExampleTabbedApp.xcworkspace -a xcode
    ```
1. If you want to add use other Material Design Components, the easiest way is to update your
   `Podfile` to include all of the components. When you're ready to release your project, be sure to
    only include those components that you use.

## Questions or Feedback
Please open an Issue in GitHub if you feel something is missing or could be improved.

