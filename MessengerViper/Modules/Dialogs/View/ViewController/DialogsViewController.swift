//
//  DialogsViewController.swift
//  MessengerViper
//
//  Created by Рабочий on 22/12/2018.
//  Copyright © 2018 Рабочий. All rights reserved.
//

import UIKit

class DialogsViewController: UIViewController {
    private var presenter: DialogsPresenterInput!
    @IBOutlet weak var tableView: UITableView!
    
    private let kDialogTableViewCellNib = UINib(nibName: "DialogTableViewCell", bundle: nil)
    private let kDialogTableViewCellReuseIdentifier = "kDialogTableViewCellNib"
    
    private var dataSource = [Dialog]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.interactorInput.getDialogs()
        setUpUI()
    }
}

extension DialogsViewController: DialogsViewInput {
    func updateDialogs(dialogs: [Dialog]) {
        dataSource = dialogs
        tableView.reloadData()
    }
    
    var presenterInput: DialogsPresenterInput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
}

// MARK: - Set Up UI

extension DialogsViewController {
    private func setUpUI() {
        tableView.register(kDialogTableViewCellNib,
                           forCellReuseIdentifier: kDialogTableViewCellReuseIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 64
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource Implementation

extension DialogsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: kDialogTableViewCellReuseIdentifier,
                                          for: indexPath) as? DialogTableViewCell else {
                                            return UITableViewCell()
        }
        cell.viewModel = dataSource[indexPath.row]
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate Implementation

extension DialogsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToChat", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Prepare for segue

extension DialogsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToChat" {
            guard let rowIndex = tableView.indexPathForSelectedRow?.row else {
                return
            }
            presenter.output.selected(dialog: dataSource[rowIndex], chatViewController: (segue.destination as! ChatsViewController))
        }
    }
}
