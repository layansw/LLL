import SwiftUI

struct BookmarkButton: View {
    let isBookmarked: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                .font(.system(size: 24))
                .foregroundStyle(AppTheme.Colors.primaryAccent)
        }
        .buttonStyle(.plain)
    }
}
