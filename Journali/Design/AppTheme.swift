import SwiftUI

extension Color {
    init(hex: UInt32) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: 1
        )
    }
}

enum AppTheme {

    // MARK: - Colors (Sketch: 01 Colors)
    enum Colors {
        static let primaryAccent     = Color(hex: 0x7F81FF) // Save button, active actions
        static let textAccent        = Color(hex: 0xAF99FD) // Journal titles, empty-state heading
        static let textPrimary       = Color(hex: 0xFFFFFF) // Main headings, journal content
        static let textSecondary     = Color(hex: 0xA39A9A) // Entry dates
        static let surfaceCard       = Color(hex: 0x1C1C1E) // Journal cards
        static let backgroundPrimary = Color(hex: 0x000000) // Main screen background
        static let destructive       = Color(hex: 0xFD453C) // Delete action
    }

    // MARK: - Typography (Sketch: 02 Typography, SF Pro)
    enum Fonts {
        static let display        = Font.system(size: 42, weight: .black)
        static let headingL       = Font.system(size: 34, weight: .bold)
        static let headingM       = Font.system(size: 24, weight: .bold)
        static let titleCard      = Font.system(size: 24, weight: .semibold)
        static let bodyL          = Font.system(size: 20, weight: .regular)
        static let bodyM          = Font.system(size: 18, weight: .regular)
        static let bodySupporting = Font.system(size: 18, weight: .light)
        static let captionM       = Font.system(size: 16, weight: .regular)
        static let captionS       = Font.system(size: 14, weight: .regular)
    }

    // MARK: - Layout
    enum Layout {
        static let screenPadding: CGFloat = 20
        static let cardRadius: CGFloat = 28
        static let cardPadding: CGFloat = 20
    }

    // MARK: - Image asset names (Assets.xcassets)
    enum Assets {
        static let notebook = "1" // الدفتر المقفل (Splash)
        static let openBook = "2" // الدفتر المفتوح (Empty state)
    }
}
