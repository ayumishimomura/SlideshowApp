//
//  ViewController.swift
//  SlideshowApp
//
//  Created by user on 2021/07/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var goExpansion: UIButton!
    @IBOutlet var startStopButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var goForeward: UIButton!
    @IBOutlet var goReturn: UIButton!
    
    var nowIndex:Int = 0
    
    var timer: Timer!
    
    var imageArray:[UIImage] = [
        UIImage(named: "st_hanebashi.jpg")!,
        UIImage(named: "st_yosai.jpg")!,
        UIImage(named: "st_chinoue.jpg")!
    ]
    var changeImgNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    @IBAction func startStopButton(_ sender: Any) {
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            startStopButton.setTitle("停止", for: .normal)
            self.goForeward.isEnabled = false
            self.goReturn.isEnabled = false
        } else {
            timer.invalidate()
            timer = nil
            startStopButton.setTitle("再生", for: .normal)
            self.goForeward.isEnabled = true
            self.goReturn.isEnabled = true
        }
    }
    
    @IBAction func goExpansion(_ sender: Any) {
        if self.timer == nil {
            self.startStopButton.setTitle("再生", for: .normal)
            self.goForeward.isEnabled = true
            self.goReturn.isEnabled = true
        } else {
            self.timer.invalidate()
            self.timer = nil
            self.startStopButton.setTitle("再生", for: .normal)
            self.goForeward.isEnabled = true
            self.goReturn.isEnabled = true
        }
    }
    
    @objc func changeImage() {
         nowIndex += 1
         if (nowIndex == imageArray.count) {
             nowIndex = 0
         }
         imageView.image = imageArray[nowIndex]
     }
    
    @IBAction func goForward(_ sender: Any) {
        nowIndex += 1
        if (nowIndex == imageArray.count) {
            nowIndex = 0
        }
        imageView.image = imageArray[nowIndex]
            }
    
    @IBAction func goReturn(_ sender: Any) {
        nowIndex -= 1
        if (nowIndex < 0) {
            nowIndex = imageArray.count - 1
        }
        imageView.image = imageArray[nowIndex]
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        let expansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        expansionViewController.expansionImage = imageArray[nowIndex]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}

