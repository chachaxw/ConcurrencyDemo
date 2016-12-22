//
//  ViewController.swift
//  ConcurrencyDemo
//
//  Created by Hossam Ghareeb on 11/15/15.
//  Copyright © 2015 Hossam Ghareeb. All rights reserved.
//

import UIKit

let imageURLs = ["http://7xqacx.com1.z0.glb.clouddn.com/1.jpg", "http://7xqacx.com1.z0.glb.clouddn.com/2.jpg", "http://7xqacx.com1.z0.glb.clouddn.com/3.jpg", "http://7xqacx.com1.z0.glb.clouddn.com/4.jpg"]

class Downloader {
    
    class func downloadImageWithURL(_ url:String) -> UIImage! {
        
        let data = try? Data(contentsOf: URL(string: url)!)
        return UIImage(data: data!)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    @IBAction func didClickOnStart(_ sender: AnyObject) {
//        
//        let img1 = Downloader.downloadImageWithURL(imageURLs[0])
//        self.imageView1.image = img1
//        
//        let img2 = Downloader.downloadImageWithURL(imageURLs[1])
//        self.imageView2.image = img2
//        
//        let img3 = Downloader.downloadImageWithURL(imageURLs[2])
//        self.imageView3.image = img3
//        
//        let img4 = Downloader.downloadImageWithURL(imageURLs[3])
//        self.imageView4.image = img4
//        
//    }

      /// global queue
//    @IBAction func didClickOnStart(_ sender: AnyObject) {
//        let queue = DispatchQueue.global(qos: .default)
//        let main = DispatchQueue.main
//        
//        queue.async {
//            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
//            main.async {
//                self.imageView1.image = img1
//            }
//        }
//        
//        queue.async {
//            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
//            main.async {
//                self.imageView2.image = img2
//            }
//        }
//        
//        queue.async {
//            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
//            main.async {
//                self.imageView3.image = img3
//            }
//        }
//        
//        queue.async {
//            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
//            main.async {
//                self.imageView4.image = img4
//            }
//        }
//    }
    
    /// Serial Queue
//    @IBAction func didClickOnStart(_ sender: AnyObject) {
//        let serialQueue = DispatchQueue(label: "serialQueue1")
//        let main = DispatchQueue.main
//        
//        serialQueue.async {
//            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
//            main.async {
//                self.imageView1.image = img1
//            }
//        }
//        
//        serialQueue.async {
//            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
//            main.async {
//                self.imageView2.image = img2
//            }
//        }
//        
//        serialQueue.async {
//            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
//            main.async {
//                self.imageView3.image = img3
//            }
//        }
//        
//        serialQueue.async {
//            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
//            main.async {
//                self.imageView4.image = img4
//            }
//        }
//    }

    /// NSOperationQueue
    @IBAction func didClickOnStart(_ sender: AnyObject) {
        let queue = OperationQueue()
        let main = OperationQueue.main
        
        let operation1 = BlockOperation(block: {
            let img1 = Downloader.downloadImageWithURL(imageURLs[0])
            main.addOperation({
                self.imageView1.image = img1
            })
        })
        operation1.completionBlock = {
            print("Operation 1 completed")
        }
        queue.addOperation(operation1)
        
        
        let operation2 = BlockOperation(block: {
            let img2 = Downloader.downloadImageWithURL(imageURLs[1])
            main.addOperation({
                self.imageView2.image = img2
            })
        })
        operation2.completionBlock = {
            print("Operation 2 completed")
        }
        queue.addOperation(operation2)
        
        
        let operation3 = BlockOperation(block: {
            let img3 = Downloader.downloadImageWithURL(imageURLs[2])
            main.addOperation({
                self.imageView3.image = img3
            })
        })
        operation3.completionBlock = {
            print("Operation 3 completed")
        }
        queue.addOperation(operation3)
        
        
        let operation4 = BlockOperation(block: {
            let img4 = Downloader.downloadImageWithURL(imageURLs[3])
            main.addOperation({
                self.imageView4.image = img4
            })
        })
        operation4.completionBlock = {
            print("Operation 4 completed")
        }
        queue.addOperation(operation4)
        
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        self.sliderValueLabel.text = "\(sender.value * 100.0)"
    }

}

