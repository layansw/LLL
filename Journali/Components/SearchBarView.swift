import SwiftUI

struct SearchBarView: View {
    @Binding var text: String

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(AppTheme.Colors.textSecondary)

            TextField(
                "",
                text: $text,
                prompt: Text(AppStrings.searchPlaceholder)
                    .foregroundStyle(AppTheme.Colors.textSecondary)
            )
            .font(AppTheme.Fonts.bodyM)
            .foregroundStyle(AppTheme.Colors.textPrimary)
            .submitLabel(.search)

            Image(systemName: "mic")
                .foregroundStyle(AppTheme.Colors.textSecondary)
        }
        .font(.system(size: 18))
        .padding(.horizontal, 16)
        .frame(height: 52)
        .background(.ultraThinMaterial, in: Capsule())
        .background(AppTheme.Colors.surfaceCard.opacity(0.8), in: Capsule())
    }
}
