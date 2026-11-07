//
//  ArticleCardView.swift
//  Pavunraj_task
//
//  Created by PavunRaj on 08/09/26.
//

import Foundation
import SwiftUI

struct ArticleCardView: View {
    let article: Articles
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            cardBackground
            gradientOverlay
            cardContent

        }
        .frame(width: 320, height: 420)
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
    }
    
    // MARK: - Background Image View
    @ViewBuilder
    private var cardBackground: some View {
        if let url = URL(string: article.imageURL) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .overlay(ProgressView())
                case .success(let image):
                    image
                        .resizable()
                        //.aspectRatio(contentMode: .fit)
                case .failure:
                    placeholderImage
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            placeholderImage
        }
    }
    
    @ViewBuilder
    private var placeholderImage: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.3))
            .overlay(
                Image(systemName: "photo")
                    .font(.largeTitle)
                    .foregroundStyle(.gray)
            )
    }
    
    // MARK: - Gradient Overlay
    @ViewBuilder
    private var gradientOverlay: some View {
        LinearGradient(
            colors: [
                .clear,
                .black.opacity(0.3),
                .black.opacity(0.85)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    // MARK: - Card Content Overlay
    @ViewBuilder
    private var cardContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Group {
                // Tag / Category Pill
                Text(article.prompt.isEmpty ? "PHOTOGRAPHY" : article.prompt.uppercased())
                    .font(.system(size: 11, weight: .bold))
                    .kerning(1.2)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(Capsule().fill(Color.black))
                
                // Description Text
                Text(article.shortDescription)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
                    .lineSpacing(4)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 28)
    }
    
        
}
