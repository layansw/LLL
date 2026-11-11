import SwiftUI

struct JournalCard: View {
    let journal: Journal
    let onBookmark: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .top) {
                Text(journal.title)
                    .font(AppTheme.Fonts.titleCard)
                    .foregroundStyle(AppTheme.Colors.textAccent)
                    .lineLimit(1)

                Spacer()

                BookmarkButton(isBookmarked: journal.isBookmarked, action: onBookmark)
            }

            Text(journal.formattedDate)
                .font(AppTheme.Fonts.captionM)
                .foregroundStyle(AppTheme.Colors.textSecondary)

            Text(journal.content)
                .font(AppTheme.Fonts.bodyM)
                .foregroundStyle(AppTheme.Colors.textPrimary)
                .lineLimit(5)
                .padding(.top, 14)
        }
        .padding(AppTheme.Layout.cardPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            AppTheme.Colors.surfaceCard,
            in: RoundedRectangle(cornerRadius: AppTheme.Layout.cardRadius, style: .continuous)
        )
    }
}
