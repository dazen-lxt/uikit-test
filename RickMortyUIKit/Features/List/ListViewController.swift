//
//  ListViewController.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 18/10/23.
//

import UIKit

class ListViewController: BaseViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    private var isLoading = false {
        didSet {
            isLoading ? showLoading() : hideLoading()
        }
    }

    var interactor: ListBusinessLogic?
    var router: ListWireframeLogic?
    var viewModel: [ItemViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        getData()
    }
    
    private func getData() {
        isLoading = true
        interactor?.fetchData()
    }
    
    private func setupTable() {
        view.backgroundColor = Colors.defaultBackground
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "ItemTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
}

extension ListViewController: ListDisplayLogic {
    
    func displayItems(viewModel: [ItemViewModel]) {
        self.viewModel += viewModel
        self.tableView.reloadData()
        isLoading = false
    }
}

// MARK: - UITableViewDataSource -
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
}

// MARK: - UITableViewDelegate -
extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configureView(item: viewModel[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isLoading = true
        //interactor?.fetchDetail(id: viewModel[indexPath.row].id)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let screenHeight = scrollView.frame.size.height

        if !isLoading && offsetY > contentHeight - screenHeight {
            getData()
        }
    }
}
