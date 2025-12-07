import ProjectDescription
import ProjectDescriptionHelpers

let name = Modules.Utils.rawValue

let project = Project(
    name: name,
    targets: [
        .source(
            name: name,
            product: .framework,
        ),
        .tests(
            name: name,
            internalDependencies: [
                .source,
            ],
        ),
    ],
)
