//
//  LoginSignUpVC.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import UIKit

class LoginSignUpVC: BaseVC {
    
    @IBOutlet weak var btnVwwSignUp: UIView!
    @IBOutlet weak var btmVwLogin: UIView!
    @IBOutlet weak var viewContainer: UIView!
    
    var pageviewcontroller: UIPageViewController!
    var viewControllers: [BaseVC] = [BaseVC]()
    var currentPageIndex = 0
    var nextPageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.goToLogin(notification:)), name: Notification.Name("GoToLogin"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.goToSignUp(notification:)), name: Notification.Name("GoToSignUp"), object: nil)
        
        btmVwLogin.isHidden = false
        btnVwwSignUp.isHidden = true
        self.pageviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "PageViewControllerLeaderss") as? UIPageViewController
        self.pageviewcontroller.delegate = self
        self.pageviewcontroller.dataSource = self
        if let loginVC = LoginSignUpControllers.loginVC {
            viewControllers.append(loginVC)
        }
        if let signUpVC = LoginSignUpControllers.signUpVC {
            viewControllers.append(signUpVC)
        }
        
        if let firstViewController = viewControllers.first {
            self.pageviewcontroller.setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }
        self.viewContainer.addSubview(pageviewcontroller.view)
        self.pageviewcontroller.view.frame = CGRect(x: 0, y: 0, width: self.viewContainer.frame.width, height: self.viewContainer.frame.height)
        self.addChild(pageviewcontroller)
        self.pageviewcontroller.didMove(toParent: self)
    }
    
    @objc func goToLogin(notification: Notification) {
        navigateToLogin()
    }
    
    @objc func goToSignUp(notification: Notification) {
        navigateToSignUp()
    }
    
    func navigateToSignUp() {
        let firstViewController = viewControllers[1]
        currentPageIndex = 1
        btmVwLogin.isHidden = true
        btnVwwSignUp.isHidden = false
        self.pageviewcontroller.setViewControllers([firstViewController],direction: .forward,animated: false,completion: nil)
    }
    
    func navigateToLogin() {
        if let firstViewController = viewControllers.first {
            currentPageIndex = 0
            btmVwLogin.isHidden = false
            btnVwwSignUp.isHidden = true
            self.pageviewcontroller.setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }
    }
    @IBAction func actionLogin(_ sender: Any) {
        navigateToLogin()
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
        navigateToSignUp()
    }
}

extension LoginSignUpVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewControllers.firstIndex(of: (viewController as? BaseVC)!) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard viewControllers.count > previousIndex else {
            return nil
        }
        return viewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewControllers.firstIndex(of: viewController as! BaseVC) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let viewControllersCount = viewControllers.count
        guard viewControllersCount != nextIndex else {
            return nil
        }
        guard viewControllersCount > nextIndex else {
            return nil
        }
        return viewControllers[nextIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if !completed {
            return
        }
        if pageViewController.viewControllers?.first == viewControllers[0] {
            nextPageIndex = 0
        } else if pageViewController.viewControllers?.first == viewControllers[1] {
            nextPageIndex = 1
        }
        currentPageIndex = nextPageIndex
        if currentPageIndex == 0 {
            btmVwLogin.isHidden = false
            btnVwwSignUp.isHidden = true
        } else {
            btmVwLogin.isHidden = true
            btnVwwSignUp.isHidden = false
        }
    }
}
