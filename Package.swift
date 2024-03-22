// swift-tools-version: 5.6
import PackageDescription

// Current stable version of the Amazon Chime SDK for iOS
let SDKVersion = "0.25.0"
let SDKMediaVersion = "0.20.0"
let SDKMachineLearningVersion = "0.3.0"

// Hosting url where the release artifacts are hosted.
let hostingUrl = "https://amazon-chime-sdk-ios.s3.amazonaws.com"

// Checksums for SDKs to verify that the hosted archive file matches the archive declared in the manifest file.
let SDKChecksum = "06635de26c5fcb48841e489774a550db4f87e4bd76077b919b24fd735f82fa6c"
let SDKMediaChecksum = "b9dfb5c67e8d5e980f8e1b5c42ae6da3bee2da848caf7672cc9a56f1c190adc2"
let SDKMachineLearningChecksum = "9f38aef436f9dcdcf2687ed35b6c72cbbd495d3ae1ef1f97d4f53bd0c2f974e1"

let package = Package(
    name: "AmazonChimeSDK",
    products: [
        .library(name: "AmazonChimeSDK", targets: ["AmazonChimeSDK", "AmazonChimeSDKMedia"]),
        .library(name: "AmazonChimeSDKMedia", targets: ["AmazonChimeSDKMedia"]),
        .library(name: "AmazonChimeSDKMachineLearning", targets: ["AmazonChimeSDKMachineLearning"])
    ],
    targets: [
        .binaryTarget(
            name: "AmazonChimeSDK",
            url: "\(hostingUrl)/sdk-without-bitcode/\(SDKVersion)/spm/AmazonChimeSDK-\(SDKVersion).zip",
            checksum: SDKChecksum
        ),
        .binaryTarget(
            name: "AmazonChimeSDKMedia",
            url: "\(hostingUrl)/media-no-video-codecs-without-bitcode/\(SDKMediaVersion)/spm/AmazonChimeSDKMediaNoVideoCodecs-\(SDKMediaVersion).zip",
            checksum: SDKMediaChecksum
        ),
        .binaryTarget(
            name: "AmazonChimeSDKMachineLearning",
            url: "\(hostingUrl)/machine-learning-without-bitcode/\(SDKMachineLearningVersion)/spm/AmazonChimeSDKMachineLearning-\(SDKMachineLearningVersion).zip",
            checksum: SDKMachineLearningChecksum
        )
    ]
)