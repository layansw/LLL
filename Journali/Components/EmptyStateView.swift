import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 14) {
            Image(AppTheme.Assets.openBook)
                .resizable()
                .scaledToFit()
                .frame(width: 200)

            Text(AppStrings.emptyTitle)
                .font(AppTheme.Fonts.headingM)
                .foregroundStyle(AppTheme.Colors.textAccent)

            Text(AppStrings.emptyMessage)
                .font(AppTheme.Fonts.bodyM)
                .foregroundStyle(AppTheme.Colors.textPrimary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
