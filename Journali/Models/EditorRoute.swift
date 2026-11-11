import Foundation

enum EditorRoute: Identifiable {
    case add
    case edit(Journal)

    var id: String {
        switch self {
        case .add:
            return "add"
        case .edit(let journal):
            return journal.id.uuidString
        }
    }

    var journal: Journal? {
        if case .edit(let journal) = self { return journal }
        return nil
    }
}
