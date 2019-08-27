//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 清水世那 on 2019/08/16.
//  Copyright © 2019年 清水世那. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ImagesNumber = 0
    var timer : Timer!
    var timer_sec : Float = 0
    

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func imagesAction(_ sender: Any) {
        self.performSegue(withIdentifier: "toSecond", sender: nil)
        
        
    }
    func changeImageCount (){
        if timer_sec > 2.0 {
            ImagesNumber = 1
        } else if timer_sec > 4.0{
            ImagesNumber = 2
        } else if timer_sec > 6.0{
            ImagesNumber = 3
        } else if timer_sec > 8.0{
            ImagesNumber = 0
            timer_sec = 0.0
        } else {
            ImagesNumber = 0
        }
        
    }
    @IBAction func nextImages(){
        if timer != nil {
            return ;
        }
        nextImage()
        
        print(ImagesNumber)
         displayImages()
    
    }
    @IBAction func backImages(){
        if timer != nil {
            return ;
        }
        ImagesNumber = ImagesNumber - 1
        
        if ImagesNumber  < 0 {
            ImagesNumber = 3
            
        }
        displayImages ()
        print(ImagesNumber)
   
    }
    
    func nextImage() {
        ImagesNumber += 1
        
        if ImagesNumber > 3 {
            ImagesNumber = 0
        }
        
        displayImages()
    }
    
  
    
    func displayImages () {
//
        let imageNameArray = ["ワンピース.jpg","ワンピース１.jpg","ワンピース２.jpg","ワンピース３.jpg",]
        let name = imageNameArray[ImagesNumber]
        let images = UIImage(named: name)
        imageView.image = images
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayImages ()
     

     }
    
  
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec = timer_sec + 0.1
         print(timer_sec)
      
         nextImage()
        displayImages ()
    }
 
    @IBAction func startButton(_ sender: Any) {
        if  timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self,selector:#selector(updateTimer(_:)), userInfo: nil, repeats: true)}
        else {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
        }
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let second = segue.destination as! SecondViewController
        second.passedImagesNumber = ImagesNumber
        
        
      
    }

    }




    
    
    
    




