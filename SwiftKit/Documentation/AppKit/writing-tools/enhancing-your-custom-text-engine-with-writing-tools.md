---
url: https://developer.apple.com/documentation/appkit/enhancing-your-custom-text-engine-with-writing-tools
framework: AppKit
category: Writing Tools
title: Enhancing your custom text engine with Writing Tools
kind: sampleCode
captured: 2026-05-02
---

# Enhancing your custom text engine with Writing Tools

Add Writing Tools support to your custom text engine to enhance the text editing experience.



### Overview

The systems provide easy-to-use and highly capable APIs for text editing, such as `NSTextView`, `UITextView`, and SwiftUI `TextEditor`. These APIs handle text rendering, text input, and user interactions, support multiple languages, and provide many features like spell checking and Writing Tools. Apps generally use these APIs to implement text editing.

In some cases, apps may desire to build a custom text editing experience by implementing a custom text engine and integrating the editor with system-provided features, such as Writing Tools. The sample app demonstrates how to implement a basic `NSTextInputClient` view with Writing Tools support.

> **NOTE:** This sample code project is associated with WWDC25 session 265: `https://developer.apple.com/wwdc25/265/`.

#### Configure the sample code project

To configure the sample code project, do the following in Xcode:

1. Open the sample with the latest version of Xcode.
2. Set the developer team to let Xcode automatically manage the provisioning profile. For more information, see `preparing-your-app-for-distribution#Set-the-bundle-ID` and `preparing-your-app-for-distribution#Assign-the-project-to-a-team`.







## Availability

- macOS 15.4
- Xcode 16.4



## See Also

- `Supporting Writing Tools via the pasteboard`
- `Adding Writing Tools support to a custom AppKit view`
- `NSWritingToolsCoordinator`
- `NSWritingToolsCoordinator.Delegate`
- `NSWritingToolsCoordinator.Context`
- `NSWritingToolsCoordinator.AnimationParameters`
