//
//  ViewController.swift
//  UIPageViewController
//
//  Created by HTLILI on 12/05/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    var pageTitle: String?
    var pageDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = pageTitle {
            lblTitle.text = title
        }
        if let description = pageDescription {
            lblDescription.text = description
        }
    }


}

