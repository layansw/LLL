import Foundation

struct Journal: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var content: String
    var date: Date = .now
    var isBookmarked: Bool = false
}

extension Journal {
    /// التاريخ بصيغة 02/09/2024 (أرقام إنجليزية حتى لو جوالك بالعربي)
    var formattedDate: String { Self.formatter.string(from: date) }

    private static let formatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = Locale(identifier: "en_US_POSIX")
        f.dateFormat = "dd/MM/yyyy"
        return f
    }()
}
