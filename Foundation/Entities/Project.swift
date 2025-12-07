import ProjectDescription
import ProjectDescriptionHelpers

let name = Modules.Entities.rawValue

let project = Project(
    name: name,
    targets: [
        .source(
            name: name,
            product: .framework,
        ),
        .testing(
            name: name,
            product: .framework,
            internalDependencies: [
                .source,
            ],
        ),
    ],
)
