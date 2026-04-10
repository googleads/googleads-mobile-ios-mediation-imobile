// swift-tools-version:5.3

// Copyright 2025 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "IMobileAdapter",
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "IMobileAdapterTarget",
      targets: ["IMobileAdapterTarget", "IMobileSDK"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.0.0"
    )
  ],
  targets: [
    .target(
      name: "IMobileAdapterTarget",
      dependencies: [
        .target(name: "IMobileAdapter"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "IMobileAdapterTarget"
    ),
    .binaryTarget(
      name: "IMobileAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/imobile/IMobileAdapter-2.3.4.6.zip",
      checksum: "d437ff111b2e49f0adbf0efa3fcb699b904fb708d3adb2ee4eacab3cf756375b"
    ),
    .binaryTarget(
      name: "IMobileSDK",
      url:
        "https://github.com/imobile/adnw-sdk-ios/releases/download/v2.3.4/ImobileSdkAds.xcframework.zip",
      checksum: "6085707cdbc5520b4c61df617f372ca60102b13c34485ba7205323a8cc966dc7"
    ),
  ]
)
