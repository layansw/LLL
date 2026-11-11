import SwiftUI

struct MainView: View {
    @State private var viewModel = JournalListViewModel()

    var body: some View {
        VStack(spacing: 0) {
            header
            content
        }
        .background(AppTheme.Colors.backgroundPrimary.ignoresSafeArea())
        .safeAreaInset(edge: .bottom) {
            SearchBarView(text: $viewModel.searchText)
                .padding(.horizontal, AppTheme.Layout.screenPadding)
                .padding(.bottom, 8)
        }
        .sheet(item: $viewModel.editorRoute) { route in
            JournalEditorView(journal: route.journal) { journal in
                viewModel.save(journal)
            }
        }
        .alert(
            AppStrings.deleteTitle,
            isPresented: Binding(
                get: { viewModel.journalToDelete != nil },
                set: { if !$0 { viewModel.journalToDelete = nil } }
            ),
            presenting: viewModel.journalToDelete
        ) { journal in
            Button(AppStrings.cancel, role: .cancel) {
                viewModel.journalToDelete = nil
            }
            Button(AppStrings.delete, role: .destructive) {
                viewModel.delete(journal)
            }
        } message: { _ in
            Text(AppStrings.deleteMessage)
        }
    }

    // MARK: - Header
    private var header: some View {
        HStack {
            Text(AppStrings.journalTitle)
                .font(AppTheme.Fonts.headingL)
                .foregroundStyle(AppTheme.Colors.textPrimary)

            Spacer()

            HeaderActionsView(filter: $viewModel.filter) {
                viewModel.editorRoute = .add
            }
        }
        .padding(.horizontal, AppTheme.Layout.screenPadding)
        .padding(.top, 8)
        .padding(.bottom, 12)
    }

    // MARK: - Content
    @ViewBuilder
    private var content: some View {
        if !viewModel.hasJournals {
            EmptyStateView()
        } else if viewModel.visibleJournals.isEmpty {
            Text(AppStrings.noResults)
                .font(AppTheme.Fonts.bodyM)
                .foregroundStyle(AppTheme.Colors.textSecondary)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            journalList
        }
    }

    private var journalList: some View {
        List(viewModel.visibleJournals) { journal in
            JournalCard(journal: journal) {
                viewModel.toggleBookmark(journal)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                viewModel.editorRoute = .edit(journal)
            }
            .listRowInsets(EdgeInsets(
                top: 8,
                leading: AppTheme.Layout.screenPadding,
                bottom: 8,
                trailing: AppTheme.Layout.screenPadding
            ))
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                Button {
                    viewModel.journalToDelete = journal
                } label: {
                    Image(systemName: "trash.fill")
                }
                .tint(AppTheme.Colors.destructive)
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
}

#Preview { MainView() }
