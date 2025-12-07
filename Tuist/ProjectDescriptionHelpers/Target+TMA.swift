import ProjectDescription

public extension Target {
    static func source(name: String, product: Product, internalDependencies: [TMATarget] = [], externalDependencies: [TargetDependency] = []) -> Target {
        let target = TMATarget.source.rawValue
        return .target(
            name: name,
            destinations: .iOS,
            product: product,
            bundleId: "\(Default.team).\(name)",
            deploymentTargets: Default.deploymentTarget,
            infoPlist: .default,
            buildableFolders: [
                .init(stringLiteral: target),
            ],
            dependencies: internalDependencies.converted(with: name) + externalDependencies,
            settings: Default.settings(),
        )
    }
    
    static func interface(name: String, product: Product) -> Target {
        let target = TMATarget.interface.rawValue
        return .target(
            name: "\(name)\(target)",
            destinations: .iOS,
            product: product,
            bundleId: "\(Default.team).\(name)\(target)",
            deploymentTargets: Default.deploymentTarget,
            infoPlist: .default,
            buildableFolders: [
                .init(stringLiteral: target),
            ],
            dependencies: [],
            settings: Default.settings(),
        )
    }
    
    static func tests(name: String, internalDependencies: [TMATarget], externalDependencies: [TargetDependency] = []) -> Target {
        let target = TMATarget.tests.rawValue
        return .target(
            name: "\(name)\(target)",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "\(Default.team).\(name)\(target)",
            deploymentTargets: Default.deploymentTarget,
            infoPlist: .default,
            buildableFolders: [
                .init(stringLiteral: target),
            ],
            dependencies: internalDependencies.converted(with: name) + externalDependencies,
            settings: Default.settings(),
        )
    }
    
    static func testing(name: String, product: Product, internalDependencies: [TMATarget], externalDependencies: [TargetDependency] = []) -> Target {
        let target = TMATarget.testing.rawValue
        return .target(
            name: "\(name)\(target)",
            destinations: .iOS,
            product: product,
            bundleId: "\(Default.team).\(name)\(target)",
            deploymentTargets: Default.deploymentTarget,
            infoPlist: .default,
            buildableFolders: [
                .init(stringLiteral: target),
            ],
            dependencies: internalDependencies.converted(with: name) + externalDependencies,
            settings: Default.settings(),
        )
    }
    
    static func example(name: String, internalDependencies: [TMATarget], externalDependencies: [TargetDependency] = []) -> Target {
        let target = TMATarget.example.rawValue
        return .target(
            name: "\(name)\(target)",
            destinations: [
                .iPhone,
            ],
            product: .app,
            bundleId: "\(Default.team).\(name)\(target)",
            deploymentTargets: Default.deploymentTarget,
            infoPlist: .extendingDefault(with: Default.infoPlist()),
            buildableFolders: [
                .init(stringLiteral: target),
            ],
            dependencies: internalDependencies.converted(with: name) + externalDependencies,
            settings: Default.settings(),
        )
    }
}
