//
//  ViewController.swift
//  LabTest1
//
//  Created by Sohel Pasha on 2018-11-14.
//  Copyright © 2018 lambton. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var pageViewController : UIPageViewController?
    let pageControl =  UIPageControl.appearance()
    let images = ["one","two","three","four","five","six","seven","eight","nine","ten"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createPageViewController()
        setupPageControl()
    }

    func createPageViewController(){
        let pageController = self.storyboard?.instantiateViewController(withIdentifier: "PageController") as! UIPageViewController
        pageController.dataSource = self
        if images.count > 0
        {
            let firstController = getItemController(0)!
            let startingViewController = [firstController]
            pageController.setViewControllers(startingViewController, direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        }
        pageViewController = pageController
        addChild(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController?.didMove(toParent: self)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index: Int = (viewController as! ItemViewController).itemIndex
        if index == 0 || index == NSNotFound{
            index = self.images.count
        }
        index = index-1
        return getItemController(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index: Int = (viewController as! ItemViewController).itemIndex
        if index == NSNotFound{
            return nil
        }
        index = index+1
        if index == self.images.count{
            index = 0
        }
        return getItemController(index)
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return images.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    func getItemController(_ itemIndex: Int) -> ItemViewController?{
        if itemIndex < images.count{
            let pageItemController = self.storyboard?.instantiateViewController(withIdentifier: "ItemController") as! ItemViewController
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = images[itemIndex]
            return pageItemController
        }
        return nil
    }
    func setupPageControl(){
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.backgroundColor = UIColor.red
        
        
    }
}

