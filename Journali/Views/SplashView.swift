import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            AppTheme.Colors.backgroundPrimary.ignoresSafeArea()

            VStack(spacing: 12) {
                Image(AppTheme.Assets.notebook)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130, height: 150)

                Text(AppStrings.appName)
                    .font(AppTheme.Fonts.display)
                    .foregroundStyle(AppTheme.Colors.textPrimary)

                Text(AppStrings.tagline)
                    .font(AppTheme.Fonts.bodySupporting)
                    .foregroundStyle(AppTheme.Colors.textPrimary)
            }
        }
    }
}

#Preview { SplashView() }
