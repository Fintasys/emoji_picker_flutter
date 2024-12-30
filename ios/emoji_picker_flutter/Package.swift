// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "emoji_picker_flutter",
    platforms: [
        .iOS("12.0"),
        .macOS("10.14")
    ],
    products: [
        // If the plugin name contains "_", replace with "-" for the library name.
        .library(name: "emoji-picker-flutter", targets: ["emoji_picker_flutter"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "emoji_picker_flutter",
            dependencies: [],
            resources: [
                // TODO: If your plugin requires a privacy manifest
                // (e.g. if it uses any required reason APIs), update the PrivacyInfo.xcprivacy file
                // to describe your plugin's privacy impact, and then uncomment this line.
                // For more information, see:
                // https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
                // .process("PrivacyInfo.xcprivacy"),

                // TODO: If you have other resources that need to be bundled with your plugin, refer to
                // the following instructions to add them:
                // https://developer.apple.com/documentation/xcode/bundling-resources-with-a-swift-package
            ]
        )
    ]
)