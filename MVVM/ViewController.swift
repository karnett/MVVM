//
//  ViewController.swift
//  MVVM
//
//  Created by karnett on 4/24/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TodoDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!

    var viewModel: ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        beginLoading()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.viewModel = ViewModel(delegate: self)
    }

    //Delegate
    func refresh() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.stopLoading()
        }
    }

    private func beginLoading() {
        tableView.isHidden = true
        loadingSpinner.startAnimating()
    }

    private func stopLoading() {
        tableView.isHidden = false
        loadingSpinner.stopAnimating()
    }
    
    // MARK: TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getNumberOfRows() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoList", for: indexPath)
        let todoItem = viewModel?.getData(row: indexPath.row)
        cell.textLabel?.text = todoItem?.title
        return cell
    }
}
