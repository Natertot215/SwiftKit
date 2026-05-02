---
url: https://developer.apple.com/documentation/apple-silicon/porting-your-macos-apps-to-apple-silicon
framework: AppKit
category: Essentials
title: Porting your macOS apps to Apple Silicon
kind: article
captured: 2026-05-01
---

# Porting your macOS apps to Apple silicon

## Overview

Port your existing macOS app to Apple silicon by creating a universal binary and modifying your code to handle architectural differences. A universal binary looks no different than a regular app, but its executable file contains two versions of your compiled code. One version runs natively on Apple silicon, and the other runs natively on Intel-based Mac computers. At runtime, the system automatically chooses which version to run on the current platform.

To build a universal binary, you need Xcode 12 or a later version, which adds `arm64` to the standard list of build architectures for macOS binaries. When you open your project and do a clean build, Xcode creates a universal binary automatically if your project uses the standard architectures. If you use custom makefiles or build scripts, add the `arm64` architecture to your build system.

After you create a universal binary, test it on both architectures and determine whether you need to make additional changes. macOS frameworks shield apps from most architectural differences between platforms, but some differences may still require you to change your code.

> **Note:** On Apple silicon, apps built for the `x86_64` architecture run under the Rosetta translation environment.

## Key Sections

### Create a Porting Plan

Early in the porting process, identify the workflow you'll use to build and test your code. Always test, tune, and validate your code on both computer types to uncover issues specific to that architecture.

Identify potential areas to investigate during the porting process. Make a note of any code that:

- Interacts with third-party libraries you don't own
- Interacts with the kernel or hardware
- Relies on specific GPU behaviors
- Contains assembly instructions
- Manages threads or optimizes your app's multithreaded behavior
- Contains hardware-specific assumptions or performance optimizations

Always have a well-defined test plan with automated test suites you can run at build time. Gather metrics on your app's performance and memory usage on both platforms.

### Obtain Universal Versions of Linked Libraries

If your project depends on any third-party libraries, contact the original vendors and ask them to provide universal versions. All code running in the same process must support the same architecture. You cannot produce a universal version of your binary without universal versions of all linked libraries.

### Update Plug-Ins to Universal Binaries

A universal plug-in runs natively on any Mac computer. Create universal versions of plug-ins that you manage. If your app loads plug-ins directly into its process space, universal plug-ins are essential since code running in the same process must support the same architecture.

For out-of-process plug-ins using XPC services, provide two non-universal XPC services—one to run `arm64` plug-ins and one to run `x86_64` plug-ins. Give each one a unique bundle identifier so they may run simultaneously.

### Address Architectural Differences

Audit your code to identify fixes for potential architectural issues. The following list identifies several known architectural differences between Apple silicon and Intel-based Mac computers:

- Virtual memory-page sizes
- Cache line sizes
- Variadic functions
- Memory that is simultaneously writable and executable
- Just-in-time compilers
- Realtime threads
- Explicit thread priorities
- Hardware-specific details
- Assembly-language instructions or builtin intrinsics
- Vector unit instructions
- C++ ABI details

> **Note:** Both Apple silicon and Intel-based Mac computers use the little-endian format for data, so you don't need to make endian conversions in your code.

### Update GPU-Specific Code

Metal on Apple silicon supports features of both Intel-based Mac computers and iOS devices. Be aware of the following differences:

- The GPU and CPU on Apple silicon share memory
- OpenGL is deprecated, but is available on Apple silicon
- OpenCL is deprecated, but is available on Apple silicon when targeting the GPU; the OpenCL CPU device is not available to arm64 apps

### Update Drivers, System Extensions, and Kernel Extensions

When porting code to macOS 11:

- Implement hardware drivers using DriverKit; macOS 11 requires DriverKit where available
- Kernel extensions must support the native architecture; you cannot run kernel extensions using Rosetta translation
- Installation and uninstallation of kernel extensions requires a reboot

### Migrate Away from Specific Technologies

macOS includes deprecated technologies. If your app uses these, migrate to replacements:

- **OpenGL** → Use **Metal** instead
- **OpenCL** → Use **Metal** instead
- **AddressBook** → Use the **Contacts** framework instead
- **Carbon APIs** → Migrate to **AppKit**, **Foundation**, and other modern APIs
- **IOKit kernel extensions** → Migrate to **DriverKit** where appropriate

### Debug and Test Your Code

Apple silicon supports all debugging and testing tools found on Intel-based Mac computers. Use the Xcode IDE to set and monitor breakpoints. Use `lldb` from the command line to perform similar tasks outside of the Xcode interface.

### Tune Your App's Performance

Apple silicon runs all performance tools found on Intel-based Mac computers. Use Instruments and command-line tools such as `leaks`, `heap`, `top`, `fs_usage`, `sc_usage`, `vm_stat`, `otool`, `sample`, `malloc_history`, and `vmmap` to identify potential performance issues.

Key considerations:

- Don't assume a discrete GPU means better performance; the integrated GPU in Apple processors is optimized for high performance graphics tasks
- Don't assume that all processor cores are equal; use Quality-of-Service (QoS) classes to help the system schedule tasks on the right type of core

During the porting process, measure your app's performance on both platforms and investigate any discrepancies.

## See Also

- Building a universal macOS binary
- Addressing architectural differences in your macOS code
- Porting your audio code to Apple silicon
- Porting just-in-time compilers to Apple silicon
