//
//  ArticleDetailView.swift
//  Pavunraj_task
//
//  Created by PavunRaj on 08/09/26.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Articles
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                headerSection
                articleContentSection
            }
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea()
    }
    
    // MARK: - Header Section (Image + Back Button)
    @ViewBuilder
    private var headerSection: some View {
        ZStack(alignment: .topLeading) {
            headerImageView
            backButtonView
        }
    }
    
    @ViewBuilder
    private var headerImageView: some View {
        if let url = URL(string: article.imageURL) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 320)
                        .overlay(ProgressView())
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 320)
                        .clipped()
                case .failure:
                    placeholderView
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            placeholderView
        }
    }
    
    @ViewBuilder
    private var placeholderView: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.3))
            .frame(height: 320)
            .overlay(
                Image(systemName: "photo")
                    .font(.largeTitle)
                    .foregroundStyle(.gray)
            )
    }
    
    @ViewBuilder
    private var backButtonView: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "arrow.left")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.black)
                .padding(14)
                .background(Circle().fill(Color.white))
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
        }
        .padding(.top, 50)
        .padding(.leading, 30)
    }
    
    // MARK: - Article Content Section
    @ViewBuilder
    private var articleContentSection: some View {
        VStack(spacing: 20) {
            // Category Tag
            Text(article.prompt.isEmpty ? "PHOTOGRAPHY" : article.prompt.uppercased())
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(Capsule().fill(Color.black))
            
            // Headline Description
            Text(article.shortDescription)
                .font(.system(size: 22, weight: .bold))
                .foregroundStyle(.primary)
                .multilineTextAlignment(.center)
                .lineSpacing(6)
                .padding(.horizontal, 24)
            
            // Full Body Content
            Text(article.content)
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(6)
                .padding(.horizontal, 24)
        }
        .padding(.horizontal, 30)
    }
}
