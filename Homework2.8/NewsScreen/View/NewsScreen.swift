//
//  SecondScreen.swift
//  Homework1.1
//
//  Created by Артем Порозов on 07.12.2021.
//

import SwiftUI

struct NewsScreen: View {
    
    var body: some View {
        NavigationView() {
            NewsScreenListView()
        }
    }
    
}

struct NewsScreenListView: View {
    
    @EnvironmentObject var newsScreenViewModel: NewsScreenViewModel
    @State var listViewTypeChoice = 0
    
    var body: some View {
        VStack {
            Picker("Lists", selection: $listViewTypeChoice) {
                Text("Apple").tag(0)
                Text("COVID").tag(1)
            }
            .pickerStyle(.segmented)
            
            if listViewTypeChoice == 0 {
                NewsListView()
            } else {
                NewsListView2()
            }
            Spacer()
        }
        .navigationBarTitle(Text(newsScreenViewModel.title))
    }
    
}

struct NewsListView: View {
    
    @StateObject var newsViewModel: NewsListViewModel = .init(newsCategory: "Apple")
    
    var body: some View {
        List(newsViewModel.articles) { article in
            NewsArticleCell(article: article)
                .showActivityIndicator(newsViewModel.isPageLoading && newsViewModel.articles.isLast(article))
                .onAppear {
                    if newsViewModel.articles.isLast(article) {
                        newsViewModel.loadNextPage()
                    }
                }
        }
        .listStyle(.plain)
    }
    
}

struct NewsListView2: View {
    
    @StateObject var newsViewModel: NewsListViewModel = .init(newsCategory: "COVID")
    
    var body: some View {
        List(newsViewModel.articles) { article in
            NewsArticleCell(article: article)
                .showActivityIndicator(newsViewModel.isPageLoading && newsViewModel.articles.isLast(article))
                .onAppear {
                    if newsViewModel.articles.isLast(article) {
                        newsViewModel.loadNextPage()
                    }
                }
        }
        .listStyle(.plain)
    }
    
}

struct NewsArticleCell: View {
    
    var article: Article
    
    var animation: Animation {
        Animation.spring(response: 0.5, dampingFraction: 0.2, blendDuration: 0.5).speed(2.0).delay(0)
    }
    
    @State var color: Bool = false
    @State var scale: Bool = false
    
    var body: some View {
        Text(article.title ?? "")
            .scaleEffect(scale ? 2.0 : 1.0)
            .foregroundColor(color ? .red : .black)
            .onTapGesture {
                withAnimation(animation) {
                    scale.toggle()
                    color.toggle()
                }
                scale.toggle()
            }
    }
    
}

