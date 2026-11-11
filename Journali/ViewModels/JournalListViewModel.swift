import SwiftUI
import Observation

@Observable
final class JournalListViewModel {

    private(set) var journals: [Journal] = []
    var searchText = ""
    var filter: JournalFilter = .all
    var journalToDelete: Journal?
    var editorRoute: EditorRoute?

    private let storage = JournalStorage()

    init() {
        journals = storage.load()
    }

    var hasJournals: Bool { !journals.isEmpty }

    var visibleJournals: [Journal] {
        var result = journals

        switch filter {
        case .all:        break
        case .byBookmark: result = result.filter(\.isBookmarked)
        case .byDate:     result = result.sorted { $0.date > $1.date }
        }

        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if !query.isEmpty {
            result = result.filter {
                $0.title.localizedCaseInsensitiveContains(query) ||
                $0.content.localizedCaseInsensitiveContains(query)
            }
        }
        return result
    }

    func save(_ journal: Journal) {
        if let index = journals.firstIndex(where: { $0.id == journal.id }) {
            journals[index] = journal
        } else {
            journals.insert(journal, at: 0)
        }
        storage.save(journals)
    }

    func toggleBookmark(_ journal: Journal) {
        guard let index = journals.firstIndex(where: { $0.id == journal.id }) else { return }
        journals[index].isBookmarked.toggle()
        storage.save(journals)
    }

    func delete(_ journal: Journal) {
        journals.removeAll { $0.id == journal.id }
        journalToDelete = nil
        storage.save(journals)
    }
}
