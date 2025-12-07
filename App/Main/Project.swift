import ProjectDescription
import ProjectDescriptionHelpers

let name = "Main"

let project = Project(
    name: name,
    targets: [
        .target(
            name: name,
            destinations: [
                .iPhone,
            ],
            product: .app,
            bundleId: "\(Default.team).\(name)",
            deploymentTargets: Default.deploymentTarget,
            infoPlist: .extendingDefault(with: Default.infoPlist()),
            buildableFolders: [
                "Source",
            ],
            dependencies: [
                Modules.ChatFeature.project(target: .source),
                Modules.LanguageModelClient.project(target: .source),
            ],
            settings: Default.settings(),
        ),
    ],
)
