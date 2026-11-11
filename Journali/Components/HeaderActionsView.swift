import SwiftUI

struct HeaderActionsView: View {
    @Binding var filter: JournalFilter
    let onAdd: () -> Void

    // القائمة تعرض خيارين بس، مثل التصميم
    private let options: [JournalFilter] = [.byBookmark, .byDate]

    var body: some View {
        HStack(spacing: 0) {
            Menu {
                ForEach(options) { option in
                    Button {
                        // الضغط على الخيار الفعّال يلغيه ويرجع للكل
                        filter = (filter == option) ? .all : option
                    } label: {
                        if filter == option {
                            Label(option.title, systemImage: "checkmark")
                        } else {
                            Text(option.title)
                        }
                    }
                }
            } label: {
                Image(systemName: "line.3.horizontal.decrease")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(AppTheme.Colors.textPrimary)
                    .frame(width: 52, height: 48)
            }

            Button(action: onAdd) {
                Image(systemName: "plus")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(AppTheme.Colors.textPrimary)
                    .frame(width: 52, height: 48)
            }
        }
        .background(AppTheme.Colors.surfaceCard, in: Capsule())
    }
}
