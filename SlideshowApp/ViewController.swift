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
        UIImage(named: "st_hanebashi")!,
        UIImage(named: "st_yosai")!,
        UIImage(named: "st_chinoue")!
    ]
    var changeImgNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        let expansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        expansionViewController.expansionImage = self.imageArray[nowIndex]
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

    @objc func changeImage() {
         nowIndex += 1
         if (nowIndex == imageArray.count) {
             nowIndex = 0
         }
         imageView.image = imageArray[nowIndex]
     }
    
    @IBAction func goForward(_ sender: Any) {
        if changeImgNo == 0 {
            changeImgNo = 1
        } else if changeImgNo == 1 {
            changeImgNo = 2
        } else if changeImgNo == 2 {
            changeImgNo = 0
        }
        let name = imageArray[changeImgNo]
        imageView.image = UIImage?(name)
            }
    
    @IBAction func goReturn(_ sender: Any) {
        if changeImgNo == 0 {
            changeImgNo = 2
        } else if changeImgNo == 1 {
            changeImgNo = 0
        } else if changeImgNo == 2 {
            changeImgNo = 1
        }
        let name = imageArray[changeImgNo]
        imageView.image = UIImage?(name)
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

}

