//
//  PageViewController.swift
//  imageView
//
//  Created by ISAAC DAVID SANTIAGO on 08/05/22.
//

import UIKit

class PageViewController: UIPageViewController {

    private var myControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myGreenVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "vcGreen")
        
        let myPinkVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "vcBlue")
        
        myControllers.append(myGreenVC)
        myControllers.append(myPinkVC)
        
        setViewControllers([myGreenVC], direction: .forward, animated: true, completion: nil)
        dataSource = self
    }
    

}

extension PageViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = myControllers.firstIndex(of: viewController)
        if index == 0{
            return myControllers.last
        }else{
            return myControllers.first
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = myControllers.firstIndex(of: viewController)
        
        if index == 0{
            return myControllers.last
        }else{
            return myControllers.first
        }
    }
    
    
    
}
