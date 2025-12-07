import ProjectDescription
import ProjectDescriptionHelpers

let name = Modules.ChatFeature.rawValue

let project = Project(
    name: name,
    targets: [
        .source(
            name: name,
            product: .staticLibrary,
            internalDependencies: [
                .interface,
            ],
            externalDependencies: [
                Modules.DesignSystem.project(target: .source),
                Modules.LanguageModelClient.project(target: .interface),
            ],
        ),
        .interface(
            name: name,
            product: .staticLibrary,
        ),
        .tests(
            name: name,
            internalDependencies: [
                .source,
                .testing,
            ],
            externalDependencies: [
                Modules.LanguageModelClient.project(target: .testing),
            ],
        ),
        .testing(
            name: name,
            product: .staticLibrary,
            internalDependencies: [
                .interface,
            ],
            externalDependencies: [
                Modules.LanguageModelClient.project(target: .interface),
            ],
        ),
        .example(
            name: name,
            internalDependencies: [
                .source,
                .testing,
            ],
            externalDependencies: [
                Modules.LanguageModelClient.project(target: .testing),
            ],
        ),
    ],
)
