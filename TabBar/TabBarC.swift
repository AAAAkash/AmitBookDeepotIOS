//
//  TabBarC.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import UIKit

class TabBarC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let homeVC = AppStoryBoards.home.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC {
            let tabOne = UITabBarItem(title: "Home", image: UIImage(named: "ic_home"), selectedImage: UIImage(named: "ic_home_active"))
            homeVC.tabBarItem = tabOne
        if let libraryVC = AppStoryBoards.library.instantiateViewController(withIdentifier: "LibraryVC") as? LibraryVC {
            let tabTwo = UITabBarItem(title: "Library", image: UIImage(named: "ic_library"), selectedImage: UIImage(named: "ic_library_active"))
            libraryVC.tabBarItem = tabTwo
        if let searchVC = AppStoryBoards.search.instantiateViewController(withIdentifier: "SearchVC") as? SearchVC {
            let tabThree = UITabBarItem(title: "Search", image: UIImage(named: "ic_search"), selectedImage: UIImage(named: "ic_search_active"))
            searchVC.tabBarItem = tabThree
        if let cartVC = AppStoryBoards.cart.instantiateViewController(withIdentifier: "CartVC") as? CartVC {
            let tabFour = UITabBarItem(title: "Cart", image: UIImage(named: "ic_cart"), selectedImage: UIImage(named: "ic_cart_active"))
            cartVC.tabBarItem = tabFour
        if let profileVC = AppStoryBoards.loginSignUp.instantiateViewController(withIdentifier: "LoginSignUpVC") as? LoginSignUpVC {
            let tabFive = UITabBarItem(title: "Profile", image: UIImage(named: "ic_user"), selectedImage: UIImage(named: "ic_user_active"))
            profileVC.tabBarItem = tabFive
                let vc1 = UINavigationController(rootViewController: homeVC)
                let vc2 = UINavigationController(rootViewController: libraryVC)
                let vc3 = UINavigationController(rootViewController: searchVC)
                let vc4 = UINavigationController(rootViewController: cartVC)
                let vc5 = UINavigationController(rootViewController: profileVC)
                self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
            } } } } }
        self.delegate = self
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    }
}
