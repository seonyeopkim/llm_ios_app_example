import ProjectDescription
import ProjectDescriptionHelpers

let name = Modules.DesignSystem.rawValue

let project = Project(
    name: name,
    targets: [
        .source(
            name: name,
            product: .framework,
            externalDependencies: [
                Modules.Entities.project(target: .source),
                Packages.MarkdownUI.external(),
            ],
        ),
        .example(
            name: name,
            internalDependencies: [
                .source,
            ],
            externalDependencies: [
                Modules.Entities.project(target: .testing),
            ],
        ),
    ],
)
