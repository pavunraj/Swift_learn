//
//  HomeView.swift
//  Pavunraj_task
//
//  Created by PavunRaj on 08/09/26.
//

import SwiftUI

struct HomeView: View {
    @State private var articleVM = ArticleViewModel()
    @State private var selectedTab = 0
    @State private var selectedArticle: Articles? = nil
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(uiColor: UIColor.secondarySystemBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                headerView
                carouselView
                Spacer(minLength: 80)
            }
            
            bottomTabBar
        }
        .fullScreenCover(item: $selectedArticle) { article in
            ArticleDetailView(article: article)
        }
        .task {
            do {
                try await articleVM.fetchArticules()
            } catch {
                print("Error loading articles: \(error)")
            }
        }
    }
    
    // MARK: - Header View
    @ViewBuilder
    private var headerView: some View {
        VStack(spacing: 0) {
            HStack(spacing: 8) {
                Image("appLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
            }
            .padding(.top, 10)
            .padding(.bottom, 20)
            
            Text("alkye")
                .font(.system(size: 42, weight: .bold))
                .foregroundStyle(.primary)
            
            Text("The easiest test you will ever do")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    // MARK: - Carousel View
    @ViewBuilder
    private var carouselView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(articleVM.article, id: \.id) { item in
                    ArticleCardView(article: item)
                        .onTapGesture {
                            selectedArticle = item
                        }
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 8)
        }
    }
    
    // MARK: - Bottom Navigation Bar
    @ViewBuilder
    private var bottomTabBar: some View {
        HStack(spacing: 24) {
            tabButton(icon: "book.fill", tabIndex: 0)
            tabButton(icon: "list.bullet", tabIndex: 1)
            tabButton(icon: "person", tabIndex: 2)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.12), radius: 20, x: 0, y: 8)
        )
        .padding(.bottom, 24)
    }
    
    @ViewBuilder
    private func tabButton(icon: String, tabIndex: Int) -> some View {
        Button {
            selectedTab = tabIndex
        } label: {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(selectedTab == tabIndex ? .white : .primary)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(
                    Group {
                        if selectedTab == tabIndex {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color.black)
                        }
                    }
                )
        }
    }
}

#Preview {
    HomeView()
}
