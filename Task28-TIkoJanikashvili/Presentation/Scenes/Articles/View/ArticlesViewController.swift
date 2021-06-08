//
//  NewsViewController.swift
//  Task28-TIkoJanikashvili
//
//  Created by Tiko on 08.06.21.
//

import UIKit

class ArticlesViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private Properties
    private var viewModel: ArticlesListViewModelProtocol!
    private var articlesManager: ArticlesManagerProtocol!
    private var dataSource: ArticlesDataSource!
    
    // MARK: - Life Cyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViewModel()
        self.setupLayout()
    }
    
    private func setupLayout() {
        self.tableView.registerNib(class: ArticlesCell.self)
    }
    
    private func configureViewModel() {
        self.articlesManager = ArticlesManager()
        self.viewModel = ArticlesListViewModel(with: self.articlesManager)
        self.dataSource = ArticlesDataSource(with: self.tableView, viewModel: viewModel)
        self.dataSource.refresh()
    }
}
