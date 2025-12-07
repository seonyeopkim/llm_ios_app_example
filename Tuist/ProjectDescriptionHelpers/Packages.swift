import ProjectDescription

public enum Packages: String {
    case MarkdownUI
    
    public func external() -> TargetDependency {
        .external(name: self.rawValue)
    }
}
