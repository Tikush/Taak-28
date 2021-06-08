//
//  ArticlesDataSource.swift
//  Task28-TIkoJanikashvili
//
//  Created by Tiko on 08.06.21.
//

import UIKit

class ArticlesDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Private Properties
    private var tableView: UITableView!
    private var articlesList: [ArticlesViewModel] = []
    private var viewModel: ArticlesListViewModelProtocol!
    
    init(with tableView: UITableView, viewModel: ArticlesListViewModelProtocol) {
        super.init()
        self.tableView = tableView
        self.tableView.dataSource = self
        self.viewModel = viewModel
    }
    
    func refresh() {
        self.viewModel.getArticlesList { articles in
            self.articlesList = articles
//            print(articles)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.articlesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(ArticlesCell.self, for: indexPath)
        cell.configureCell(at: self.articlesList[indexPath.row])
        return cell
    }
    
}
