//
//  ItemViewController.swift
//  LabTest1
//
//  Created by Sohel Pasha on 2018-11-14.
//  Copyright © 2018 lambton. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    var itemIndex: Int = 0
    var imageName: String = ""{
        didSet {
            if let imageView = uiImageView{
                imageView.image = UIImage(named:imageName)
            }
        }
    }
    
    @IBOutlet weak var uiImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        uiImageView.image = UIImage(named: imageName)
        
    }
    

    

}
