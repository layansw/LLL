import SwiftUI
import Observation

@Observable
final class JournalEditorViewModel {

    var title: String
    var text: String
    var isAskingToDiscard = false

    private let original: Journal?

    init(journal: Journal? = nil) {
        self.original = journal
        self.title = journal?.title ?? ""
        self.text = journal?.content ?? ""
    }

    var isEditing: Bool { original != nil }

    var dateText: String {
        (original ?? Journal(title: "", content: "")).formattedDate
    }

    var hasChanges: Bool {
        title != (original?.title ?? "") ||
        text != (original?.content ?? "")
    }

    var canSave: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
        !text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    func buildJournal() -> Journal {
        var journal = original ?? Journal(title: "", content: "")
        let cleanTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        journal.title = cleanTitle.isEmpty ? AppStrings.Editor.untitled : cleanTitle
        journal.content = text
        return journal
    }
}
