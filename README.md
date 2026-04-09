# ExamplePackageTemplate

A Swift Package with an accompanying iOS example app, all within a single Xcode Workspace.

<!-- TEMPLATE_SETUP_START -->
## Using this template

1. Click **"Use this template" → "Create a new repository"**
2. Name your repo in `kebab-case` (e.g. `my-awesome-package`)
3. Create the repository

A GitHub Action will automatically rename the package, files, and source code to `PascalCase` (e.g. `MyAwesomePackage`). Your repo will be ready to work with in seconds.

> The `Example` app keeps its name — it's the example app that consumes the package.
<!-- TEMPLATE_SETUP_END -->

## Requirements

- Xcode 16+
- Swift 6.0+
- iOS 17+

## Getting Started

Open the workspace — not the `.xcodeproj` or the package directly:

```bash
open ExamplePackageTemplate.xcworkspace
```

The workspace combines the package and the example app, letting you develop both in parallel.

### Workflow

1. **Write your code** in `ExamplePackageTemplate/Sources/ExamplePackageTemplate/`
2. **Add tests** in `ExamplePackageTemplate/Tests/ExamplePackageTemplateTests/`
3. **Try it out** by running the `Example` target in the simulator

## Structure

```
ExamplePackageTemplate/
├── ExamplePackageTemplate/              # Swift Package
│   ├── Package.swift
│   ├── Sources/
│   │   └── ExamplePackageTemplate/
│   └── Tests/
│       └── ExamplePackageTemplateTests/
├── Example/                             # Example iOS app
│   ├── Example.xcodeproj/
│   └── Example/
│       ├── ExampleApp.swift
│       └── ContentView.swift
└── ExamplePackageTemplate.xcworkspace   # Open this in Xcode
```

## Installation

### Swift Package Manager

In Xcode: **File → Add Package Dependencies** and add your repository URL.

Or in `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/your-repo", from: "1.0.0")
]
```
