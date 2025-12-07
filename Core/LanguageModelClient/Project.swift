import ProjectDescription
import ProjectDescriptionHelpers

let name = Modules.LanguageModelClient.rawValue

let project = Project(
    name: name,
    targets: [
        .source(
            name: name,
            product: .framework,
            internalDependencies: [
                .interface,
            ],
        ),
        .interface(
            name: name,
            product: .framework,
        ),
        .testing(
            name: name,
            product: .framework,
            internalDependencies: [
                .interface,
            ],
            externalDependencies: [
                Modules.Utils.project(target: .source),
            ],
        ),
    ],
)
