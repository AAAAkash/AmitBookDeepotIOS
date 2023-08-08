//
//  SplashVC.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import UIKit

class SplashVC: UIViewController {
    
    @IBOutlet weak var imgLogo: UIImageView!
    var currentImageIndex = 0
    let splashImages = [UIImage(named: "AmitLogo"), UIImage(named: "AmitLogo"), UIImage(named: "AmitLogo"), UIImage(named: "AmitLogo"), UIImage(named: "AmitLogo"), UIImage(named: "AmitLogo")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgLogo.cornerRadius = 5.0
        self.imgLogo.clipsToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.animateSplash()
    }
    
    func animateSplash() {
        UIView.animate(withDuration: 0.6) {
            if self.currentImageIndex % 2 == 0 {
                self.imgLogo.image = self.splashImages[self.currentImageIndex]
                self.imgLogo.alpha = 1
                self.imgLogo.alpha = 0
            } else {
                self.imgLogo.image = self.splashImages[self.currentImageIndex]
                self.imgLogo.alpha = 0
                self.imgLogo.alpha = 1
            }
        } completion: { _ in
            self.currentImageIndex = self.currentImageIndex + 1
            if self.currentImageIndex < self.splashImages.count {
                self.animateSplash()
            } else {
                sleep(1)
                self.moveToTabBar()
            }
        }
    }
    func moveToTabBar() {
        self.changeRootController(storyboadrId: "TabBar", bundle: nil, controllerId: "TabBarC")
    }
    
    func changeRootController(storyboadrId: String, bundle: Bundle?, controllerId: String) {
        let storyboard = UIStoryboard(name: storyboadrId, bundle: nil)
        let rootvc = storyboard.instantiateViewController(withIdentifier: controllerId)
       
        if let window = UIApplication.shared.mainKeyWindow {
            window.rootViewController = rootvc
            if let defaultScreen = UserDefaults.standard.value(forKey: "defaultScreen") as? Int {
                if defaultScreen == 1 {
                    UIApplication.getTopViewController()?.tabBarController?.selectedIndex = 0
                } else {
                    UIApplication.getTopViewController()?.tabBarController?.selectedIndex = 2
                }
                //UIApplication.getTopViewController()?.tabBarController?.selectedIndex = defaultScreen == 1 ? 2 : 0
            } else {
                UIApplication.getTopViewController()?.tabBarController?.selectedIndex = 0
            }
        }
    }
}
extension UIApplication {
    class func getTopViewController(base: UIViewController? = (((UIApplication.shared.connectedScenes.first) as? UIWindowScene)?.delegate as? SceneDelegate)?.window?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
