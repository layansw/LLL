import Foundation

enum AppStrings {
    // Splash
    static let appName = "Journali"
    static let tagline = "Your thoughts, your story"

    // Main
    static let journalTitle = "Journal"
    static let searchPlaceholder = "Search"
    static let noResults = "No journals found"

    // Empty state
    static let emptyTitle = "Begin Your Journal"
    static let emptyMessage = "Craft your personal diary, tap the plus icon to begin"

    // Filter menu
    static let filterAll = "All"
    static let filterByBookmark = "Sort by Bookmark"
    static let filterByDate = "Sort by Entry Date"

    // Delete alert
    static let deleteTitle = "Delete Journal?"
    static let deleteMessage = "Are you sure you want to delete this journal?"
    static let delete = "Delete"
    static let cancel = "Cancel"

    // Editor
    enum Editor {
        static let untitled = "Untitled"
        static let titlePlaceholder = "Title"
        static let bodyPlaceholder = "Type your Journal…"
        static let discardTitle = "Are you sure you want to discard changes on this journal?"
        static let discard = "Discard Changes"
        static let keepEditing = "Keep Editing"
    }
}
