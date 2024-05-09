//
//  ViewController.swift
//  KeySafe
//
//  Created by ozan on 5.02.2024.
//

import UIKit

class MainPage: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var passwordList = [PasswordsModel]()
    var viewModel = MainPageViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        _ = viewModel.passwordList.subscribe(onNext: { liste in
            self.passwordList = liste
            self.tableView.reloadData()
            
        })

    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.passwordsLoad()
    }

    @IBAction func addButton(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let password = sender as? PasswordsModel {
                let VC = segue.destination as! InfoPage
                VC.password = password
            }
        }
    }
}

extension MainPage : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            viewModel.passwordsLoad()
        }else {
            viewModel.search(searchVocab: searchText)
        }
    }
    
}

extension MainPage : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passwordList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let password = passwordList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PasswordCell
        
        cell.labelMainTitle.text = password.mainTitle
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let password = passwordList[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: password)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
            let password = self.passwordList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete Fuction", message: "\(password.mainTitle!) delete ?", preferredStyle: .alert)
            
            let cancelAcrion = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAcrion)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                self.viewModel.delete(password: password)
            }
            alert.addAction(yesAction)
            
            self.present(alert,animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
}
