import ProjectDescription

public enum Modules: String {
    case ChatFeature
    case DesignSystem
    case Entities
    case LanguageModelClient
    case Utils
    
    var layer: String {
        switch self {
        case .ChatFeature:
            "Feature"
        case .DesignSystem, .LanguageModelClient:
            "Core"
        case .Entities, .Utils:
            "Foundation"
        }
    }
    
    public func project(target: TMATarget) -> TargetDependency {
        .project(
            target: "\(self.rawValue)\(target.suffix)",
            path: .relativeToRoot("\(self.layer)/\(self.rawValue)"),
        )
    }
}
