import SwiftUI

struct JournalEditorView: View {

    private enum Field { case title, body }

    @State private var viewModel: JournalEditorViewModel
    @FocusState private var focusedField: Field?
    @Environment(\.dismiss) private var dismiss

    let onSave: (Journal) -> Void

    init(journal: Journal?, onSave: @escaping (Journal) -> Void) {
        _viewModel = State(initialValue: JournalEditorViewModel(journal: journal))
        self.onSave = onSave
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            topBar
            titleField
            dateLabel
            bodyEditor
        }
        .padding(.horizontal, AppTheme.Layout.screenPadding)
        .padding(.top, 28)
        .tint(AppTheme.Colors.primaryAccent)
        .presentationBackground(AppTheme.Colors.surfaceCard)
        .presentationDragIndicator(.visible)
        .interactiveDismissDisabled(viewModel.hasChanges)
        .alert(
            AppStrings.Editor.discardTitle,
            isPresented: $viewModel.isAskingToDiscard
        ) {
            Button(AppStrings.Editor.discard, role: .destructive) {
                dismiss()
            }
            Button(AppStrings.Editor.keepEditing, role: .cancel) { }
        }
        .task {
            // يومية جديدة: المؤشر في العنوان. تعديل: المؤشر في النص
            focusedField = viewModel.isEditing ? .body : .title
        }
    }

    // MARK: - Top bar (X و ✓)
    private var topBar: some View {
        HStack {
            Button {
                if viewModel.hasChanges {
                    viewModel.isAskingToDiscard = true
                } else {
                    dismiss()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(AppTheme.Colors.textPrimary)
                    .frame(width: 34, height: 34)
                    .background(Color.white.opacity(0.12), in: Circle())
            }

            Spacer()

            Button {
                if viewModel.canSave {
                    onSave(viewModel.buildJournal())
                }
                dismiss()
            } label: {
                Image(systemName: "checkmark")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(AppTheme.Colors.textPrimary)
                    .frame(width: 34, height: 34)
                    .background(AppTheme.Colors.primaryAccent, in: Circle())
            }
        }
    }

    // MARK: - Title
    private var titleField: some View {
        TextField(
            "",
            text: $viewModel.title,
            prompt: Text(AppStrings.Editor.titlePlaceholder)
                .foregroundStyle(AppTheme.Colors.textSecondary)
        )
        .font(AppTheme.Fonts.headingM)
        .foregroundStyle(AppTheme.Colors.textPrimary)
        .focused($focusedField, equals: .title)
        .submitLabel(.next)
        .onSubmit { focusedField = .body }
        .padding(.top, 24)
    }

    // MARK: - Date
    private var dateLabel: some View {
        Text(viewModel.dateText)
            .font(AppTheme.Fonts.captionS)
            .foregroundStyle(AppTheme.Colors.textSecondary)
            .padding(.top, 4)
    }

    // MARK: - Body
    private var bodyEditor: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $viewModel.text)
                .font(AppTheme.Fonts.bodyM)
                .foregroundStyle(AppTheme.Colors.textPrimary)
                .scrollContentBackground(.hidden)
                .focused($focusedField, equals: .body)
                .padding(.horizontal, -5)

            if viewModel.text.isEmpty {
                Text(AppStrings.Editor.bodyPlaceholder)
                    .font(AppTheme.Fonts.bodyM)
                    .foregroundStyle(AppTheme.Colors.textSecondary)
                    .padding(.top, 8)
                    .allowsHitTesting(false)
            }
        }
        .padding(.top, 16)
    }
}

#Preview {
    JournalEditorView(journal: nil) { _ in }
}
