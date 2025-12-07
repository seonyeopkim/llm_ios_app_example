import ProjectDescription

public enum TMATarget: String {
    case source = "Source"
    case interface = "Interface"
    case tests = "Tests"
    case testing = "Testing"
    case example = "Example"
    
    var suffix: String {
        switch self {
        case .source: ""
        default: self.rawValue
        }
    }
}

extension [TMATarget] {
    func converted(with name: String) -> [TargetDependency] {
        self.map { .target(name: "\(name)\($0.suffix)") }
    }
}
