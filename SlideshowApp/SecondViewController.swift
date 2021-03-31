//
//  ScondViewController.swift
//  SlideshowApp
//
//  Created by 荒井竣哉 on 2021/03/29.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var imageViewscond: UIImageView!
    
    var imagenow:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewscond.image=imagenow

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
