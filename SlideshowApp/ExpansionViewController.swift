//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by user on 2021/07/06.
//

import UIKit

class ExpansionViewController: UIViewController {

    @IBOutlet var imageView2: UIImageView!
    
    var expansionImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        let showExpansionImage = expansionImage
        imageView2.image = showExpansionImage
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


