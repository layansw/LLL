import Foundation

struct JournalStorage {
    private let key = "journali.journals"

    func load() -> [Journal] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let journals = try? JSONDecoder().decode([Journal].self, from: data)
        else { return [] }
        return journals
    }

    func save(_ journals: [Journal]) {
        guard let data = try? JSONEncoder().encode(journals) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
}
