//
//  TableViewLibraryVC.swift
//  AmitBookDepot
//
//  Created by MAc on 09/08/23.
//

import UIKit

class TableViewLibraryVC: UIViewController {
    
    
    
    @IBOutlet weak var lblHeader: UILabel!
    
    @IBOutlet weak var myTableView: UITableView!
    
    var arrName = ["jkfdshjkgh","shughdsjkhg","sahjgjhdklgh","ndsfjkgjhkldsfhg","hsdkjghlik","hdfkjgh","sdjkghuisdyhg","jkfdshjkgh","shughdsjkhg","sahjgjhdklgh","ndsfjkgjhkldsfhg","hsdkjghlik","hdfkjgh","sdjkghuisdyhg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.myTableView.register(UINib(nibName: "MyTableLibraryVCCell", bundle: nil), forCellWithReuseIdentifier: "MyTableLibraryVCCell")
        self.myTableView.register(UINib(nibName: "MyTableLibraryVCCell", bundle: nil), forCellReuseIdentifier: "MyTableLibraryVCCell")

    }
    



}
extension TableViewLibraryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MyTableLibraryVCCell") as! MyTableLibraryVCCell
        cell.lblCell.text = arrName[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TableViewDetailVC") as! TableViewDetailVC
        self.navigationController?.pushViewController(vc,animated: true)
    }
    
    
}
