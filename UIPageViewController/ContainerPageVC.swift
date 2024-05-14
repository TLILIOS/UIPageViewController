//
//  ContainerPageVC.swift
//  UIPageViewController
//
//  Created by HTLILI on 12/05/2024.
//

import UIKit

class ContainerPageVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
   var pageControl = UIPageControl()
    var arrayContainers = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Chage page control color
//        view.backgroundColor = .red
        // LTR
//        let vc1 = (self.storyboard?.instantiateViewController(identifier: "Page1"))!
//        let vc2 = self.storyboard?.instantiateViewController(identifier: "Page2")
//        let vc3 = self.storyboard?.instantiateViewController(identifier: "Page3")
//        arrayContainers.append(vc1)
//        arrayContainers.append(vc2!)
//        arrayContainers.append(vc3!)
       
        let vc1 = self.storyboard?.instantiateViewController(identifier: "Page1") as! ViewController
        vc1.pageTitle = "Page1"
        vc1.pageColor = .blue
        vc1.pageDescription = "Believe you can and you're halfway there. - Theodore Roosevelt,The only way to do great work is to"
        let vc2 = self.storyboard?.instantiateViewController(identifier: "Page1") as! ViewController
        vc2.pageTitle = "Page2"
        vc2.pageColor = .green
        vc2.pageDescription = "The only way to do great work is to love what you do. - Steve Jobs"
        let vc3 = self.storyboard?.instantiateViewController(identifier: "Page1") as! ViewController
        vc3.pageTitle = "Page3"
        vc3.pageColor = .magenta
        vc3.pageDescription = "Success is not final, failure is not fatal: It is the courage to continue that counts. - Winston Churchill"
        
        arrayContainers.append(vc1)
        arrayContainers.append(vc2)
        arrayContainers.append(vc3)

        delegate = self
        dataSource = self
        if let firstVC = arrayContainers.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        addPageControl()
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // RTL
        guard let currentIndex = arrayContainers.firstIndex(of: viewController) else { return nil
        }
        let nextIndex = currentIndex + 1
        
        guard nextIndex < arrayContainers.count else {

            return arrayContainers.first
        }
        return arrayContainers[nextIndex]
        // Default LTR
//        guard let currentIndex = arrayContainers.firstIndex(of: viewController) else {
//            return nil
//        }
//        let previousIndex = currentIndex - 1
//        guard previousIndex >= 0 else {
////            return nil
//            return arrayContainers.last
//        }
//        return arrayContainers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // Default LTR
//        guard let currentIndex = arrayContainers.firstIndex(of: viewController) else { return nil
//        }
//        let nextIndex = currentIndex + 1
//        
//        guard nextIndex < arrayContainers.count else {
////            return nil
//            return arrayContainers.first
//        }
//        return arrayContainers[nextIndex]
        // RTL
        guard let currentIndex = arrayContainers.firstIndex(of: viewController) else {
            return nil
        }
        let previousIndex = currentIndex - 1
        guard previousIndex >= 0 else {
            return arrayContainers.last
        }
        return arrayContainers[previousIndex]
    }
    // Default Page Controller
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//       return arrayContainers.count
//    }
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return 0
//    }

    // Customized Page Controller
    func addPageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 75, width: UIScreen.main.bounds.width, height: 50))
        self.pageControl.numberOfPages = arrayContainers.count
        // LTR
//        self.pageControl.currentPage = 0
        // RTL
        self.pageControl.currentPage = arrayContainers.count - 1
        self.pageControl.tintColor = UIColor.white
        self.pageControl.pageIndicatorTintColor = .gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        // LTR
//        self.pageControl.currentPage = arrayContainers.firstIndex(of: pageContentViewController)!
        
        // RTL
        self.pageControl.currentPage = (arrayContainers.count - 1) - arrayContainers.firstIndex(of: pageContentViewController)!
    }
}
