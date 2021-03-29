//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 荒井竣哉 on 2021/03/29.
//

import UIKit

class ViewController: UIViewController {
    //outlet接続
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var startstopButton: UIButton!
    //タイマー
    var timer:Timer!

    //配列のインデックス番号
    var nowIndex:Int=0
    //スライドさせる画像の配列
    var images:[UIImage]=[
        UIImage(named: "neko1")!,
        UIImage(named: "neko2")!,
        UIImage(named: "neko3")!,
        UIImage(named: "neko4")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //再生
    @IBAction func shideShowButton(_ sender: Any) {
        if (timer == nil){
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeimage), userInfo: nil, repeats: true)
            startstopButton.setTitle("停止", for: .normal)
        }else{
            timer.invalidate()
            timer=nil
            startstopButton.setTitle("再生", for: .normal)
        }
    }
    
    @objc func changeimage() {
        nowIndex += 1
        
        if (nowIndex == images.count){
            nowIndex=0
        }
        imageView.image=images[nowIndex]
    }
    


}

