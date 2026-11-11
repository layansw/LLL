import Foundation

enum JournalFilter: CaseIterable, Identifiable {
    case all, byBookmark, byDate

    var id: Self { self }

    var title: String {
        switch self {
        case .all:        return AppStrings.filterAll
        case .byBookmark: return AppStrings.filterByBookmark
        case .byDate:     return AppStrings.filterByDate
        }
    }
}
