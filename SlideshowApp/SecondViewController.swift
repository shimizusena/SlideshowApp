//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 清水世那 on 2019/08/22.
//  Copyright © 2019年 清水世那. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
 
    func displayImages () {
        //
        let imageNameArray = ["ワンピース.jpg","ワンピース１.jpg","ワンピース２.jpg","ワンピース３.jpg",]
        let name = imageNameArray[passedImagesNumber]
        let images = UIImage(named: name)
        bigImageView.image = images
    }

    @IBOutlet var bigImageView:UIImageView!
    
    var passedImagesNumber = 0
    
    @IBAction func back (){
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        displayImages ()

      

        // Do any additional setup after loading the view.
    }
   
    
}
