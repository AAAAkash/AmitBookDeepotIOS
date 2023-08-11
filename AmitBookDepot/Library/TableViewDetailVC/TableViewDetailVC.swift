//
//  TableViewDetailVC.swift
//  AmitBookDepot
//
//  Created by MAc on 09/08/23.
//

import UIKit

class TableViewDetailVC: UIViewController {
    
    @IBOutlet weak var lblHeader: UILabel!
   
    
    @IBOutlet weak var myTableView: UITableView!
    
    //var Label = ["asdhjkfherhg","hjdfghasj","gfhg","sdgyuhfgsah","gsdayhjfgb","bsdafhbgf"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //myTableView.estimatedRowHeight = 1.0

        myTableView.register(UINib(nibName: "TableViewDetailVCCell", bundle: nil), forCellReuseIdentifier: "TableViewDetailVCCell")
        lblHeader.layer.cornerRadius = 5.0
        
    }
    
    @IBAction func btnViewAllAction(_ sender: Any) {
        
        
    }
}
extension TableViewDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "TableViewDetailVCCell", for: indexPath) as! TableViewDetailVCCell
        cell.myCollectionView.tag = indexPath.section
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//    }
    
}
