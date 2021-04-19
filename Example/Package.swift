// swift-tools-version:5.2
import PackageDescription

let package = Package(
	name: "Example",
	platforms: [
		.macOS(.v10_13)
	],
	dependencies: [
		.package(path: "..")
	],
	targets: [
		.target(
			name: "Example",
			dependencies: [
				"Aperture"
			]
		)
	]
)
