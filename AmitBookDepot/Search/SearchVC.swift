//
//  SearchVC.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import UIKit

class SearchVC: BaseVC, UITextFieldDelegate {
    
    @IBOutlet weak var txtFieldSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    
    var detail = ["sdjkgshjkg","fghdkjfghjkdf","hgsdjfjkdsahg","hjksdahgfukj","jkjkdfhgfksdj","mhjasDFjh","fjhagfhj","sgjyfgsa","asdghfghj"]
    var autharName = ["Dhiraj","Rohan","Saffi","Ishav","Raman","Navdeep","Manpreet","Gurinder","Harpreet"]
    var price = ["Rs 1.00","Rs 2.00","Rs 5.00","Rs 5.00","Rs 4.00","Rs 8.00","Rs 7.00","Rs 9.00","Rs 12.00"]
    
    var arrName: [String] = []
    var search: String = ""
    var isSearchActive:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.isHidden = true
        self.txtFieldSearch.delegate = self
        txtFieldSearch.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
       
        tableView.register(UINib(nibName: "SearchTableCell", bundle: nil), forCellReuseIdentifier: "SearchTableCell")
        
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0.5
        
        tableView.layer.cornerRadius = 5.0
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let searchText = textField.text, !searchText.isEmpty {
            isSearchActive = true
            search = searchText

            let predicate = NSPredicate(format: "SELF contains[cd] %@", search)
            let arr = (detail as NSArray).filtered(using: predicate) as? [String]
            arrName = arr ?? []
            tableView.isHidden = false
        } else {
            isSearchActive = false
            arrName = []
            tableView.isHidden = true
        }
        tableView.reloadData()
    }
}
extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearchActive ?? false
        {
            return arrName.count
        }
        else
        {
            return detail.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableCell", for: indexPath) as! SearchTableCell
        if isSearchActive ?? false
        {
            cell.lblDetail.text = arrName[indexPath.row]
        }
        else
        {
            cell.lblAuthorName.text = autharName[indexPath.row]
            cell.lblDetail.text = detail[indexPath.row]
            cell.lblPrice.text = price[indexPath.row]
            cell.cellView.layer.cornerRadius = 5.0
            cell.cellView.borderWidth = 2.0
            cell.cellView.borderColor = .systemGray5
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AppStoryBoards.library.instantiateViewController(withIdentifier: "CollectionDetailVC") as! CollectionDetailVC
        //storyboard?.instantiateViewController(withIdentifier: "CollectionDetailVC") as! CollectionDetailVC
        self.navigationController?.pushViewController(vc,animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty {
            isSearchActive = false
        }
        else
        {
            isSearchActive = true
            search = (txtFieldSearch.text ?? "") + string
        }
        let predicate = NSPredicate(format: "SELF contains[cd] %@", search)
        let arr = (autharName as NSArray).filtered(using: predicate) as? [String]
        arrName = arr ?? []
        tableView.reloadData()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tableView.isHidden = false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
       // tableView.isHidden = true
    }
}
