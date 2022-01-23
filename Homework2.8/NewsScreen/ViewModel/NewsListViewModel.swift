//
//  NewsViewModel.swift
//  Homework1.4
//
//  Created by Артем Порозов on 06.01.2022.
//

import SwiftUI

final class NewsListViewModel: ObservableObject {
    
    @Injected var articlesAPI: ArticlesAPI?
    var newsCategory: String

    @Published var articles: [Article] = []
    @Published var isPageLoading: Bool = false
    var page: Int = 0
    var totalResults: Int = Int.max
    
    init(newsCategory: String) {
        self.newsCategory = newsCategory
        loadNextPage()
    }
    
    func loadNextPage() {
        guard isPageLoading == false && totalResults > articles.count else {
            print("Nothing to load \(self.articles.count)/\(self.totalResults)")
            return
        }
        isPageLoading = true
        page += 1
        DispatchQueue.global(qos: .background).async {
            self.articlesAPI?.everythingGet(q: self.newsCategory,
                                      from: "2022-01-20",
                                      sortBy: "publishedAt",
                                      language: "ru",
                                      apiKey: "a59e5f24831a4322b535578654582973",
                                      page: self.page) { list, error in
                self.totalResults = list?.totalResults ?? Int.max
                self.articles.append(contentsOf: list?.articles ?? [])
                self.isPageLoading = false
            }
        }
    }
    
}
