//
//  CartVC.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import UIKit

class CartVC: BaseVC {
    
    @IBOutlet weak var lblCartDetail: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var btnContinueShop: UIButton!
    
    var Data = ["jfsahjksdf","hsdjkhfj","sdghfhgkj","sadhkhkj"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblCartDetail.layer.cornerRadius = 5.0
        lblCartDetail.clipsToBounds = true
        btnContinue.layer.cornerRadius = 3.0
        btnContinue.layer.shadowColor = UIColor.lightGray.cgColor
        btnContinue.layer.shadowRadius = 1.0
        btnContinue.layer.shadowOpacity = 1.0
        btnContinue.layer.shadowOffset = CGSize(width: 1, height: 1)

        self.myTableView.register(UINib(nibName: "CartVCTableCell", bundle: nil), forCellReuseIdentifier: "CartVCTableCell")
        
        let underlineAttribute = [NSAttributedString.Key.underlineStyle:NSUnderlineStyle.single.rawValue]
        let attributedTitle = NSAttributedString(string: "Continue shopping", attributes: underlineAttribute)
        btnContinueShop.setAttributedTitle(attributedTitle, for: .normal)
    }
    @IBAction func btnContinueAction(_ sender: Any) {
        
    }
    @IBAction func btnContinueShopAction(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
//        let vc = AppStoryBoards.home.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//        self.navigationController?.pushViewController(vc,animated: true)
    }
}
extension CartVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "CartVCTableCell") as! CartVCTableCell
        cell.viewCell.layer.cornerRadius = 5.0
        cell.viewCell.layer.borderColor = UIColor.systemGray5.cgColor
        cell.viewCell.layer.borderWidth = 2
        
        cell.btnNeg.tag = indexPath.row
        cell.btnPos.tag = indexPath.row
        cell.btnDel.tag = indexPath.row
        
        cell.btnNeg.addTarget(self, action:#selector(actionMinus), for: .touchUpInside)
        cell.btnPos.addTarget(self, action:#selector(actionPlus), for: .touchUpInside)
        cell.btnDel.addTarget(self, action:#selector(actionDelete), for: .touchUpInside)
        
//        cell.viewCell.layer.shadowColor = UIColor.lightGray.cgColor
//        cell.viewCell.layer.shadowRadius = 1.0
//        cell.viewCell.layer.shadowOpacity = 1.0
//        cell.viewCell.layer.shadowOffset = CGSize(width: 1, height: 1)
        //cell.viewCell.layer.masksToBounds = false
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 220
//    }
    
    @objc func actionMinus(_ sender: UIButton) {
        DispatchQueue.main.async {
            let cell = self.myTableView.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as? CartVCTableCell
            if Int(cell?.lblCount.text ?? "1") ?? 1 > 1 {
                cell?.lblCount.text = "\((Int(cell?.lblCount.text ?? "1") ?? 1) - 1)"
                cell?.lblTotalPrice.text = "Total = Rs. \(500 * (Int(cell?.lblCount.text ?? "1") ?? 1))"
            }
        }
    }
    
    @objc func actionPlus(_ sender: UIButton) {
        DispatchQueue.main.async {
            let cell = self.myTableView.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as? CartVCTableCell
            cell?.lblCount.text = "\((Int(cell?.lblCount.text ?? "1") ?? 1) + 1)"
            cell?.lblTotalPrice.text = "Total = Rs. \(500 * (Int(cell?.lblCount.text ?? "1") ?? 1))"
        }
    }
    
    @objc func actionDelete(_ sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        myTableView.beginUpdates()
        self.Data.remove(at: indexPath.row)
        myTableView.deleteRows(at: [indexPath], with: .fade)
        myTableView.endUpdates()
        myTableView.reloadData()
    }

    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let Delete = UIContextualAction(style: .normal, title: "DELETE") { _,_,_ in
//            let refreshAlert = UIAlertController(title: "Alert", message: "Are You Want to Sure delete This Row", preferredStyle: UIAlertController.Style.alert)
//            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [self] (action: UIAlertAction!) in
//                myTableView.beginUpdates()
//                self.Data.remove(at: indexPath.row)
//                myTableView.deleteRows(at: [indexPath], with: .fade)
//                myTableView.endUpdates()
//            }))
//            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
//            }))
//            self.present(refreshAlert, animated: true, completion: nil)
//        }
//        Delete.backgroundColor = .systemRed
//        let SwipeConfiguration = UISwipeActionsConfiguration(actions: [Delete])
//        return SwipeConfiguration
//    }
}
