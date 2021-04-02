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
    @IBOutlet weak var startstopButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    //タイマー
    var timer:Timer!
    //配列インデックス番号
    var nowIndex:Int=0
    //スライドさせる画像の配列
    var images:[UIImage] = [
           UIImage(named: "neko1.jpg")!,
           UIImage(named: "neko2.jpg")!,
           UIImage(named: "neko3.jpg")!,
           UIImage(named: "neko4.jpg")!
       ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    //segue
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
        }
    //送る
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondview:SecondViewController = segue.destination as! SecondViewController
        
        secondview.imagenow = imageView.image
        
    }
    //写真タップ
    @IBAction func tapImage(_ sender: Any) {
        //タイマーストップ
        if self.timer != nil{
            self.timer.invalidate()
            self.timer=nil
            startstopButton.setTitle("再生", for: .normal)
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
        //画面遷移
        self.performSegue(withIdentifier: "toSecond", sender: nil)
    }
    //進む
    @IBAction func nextButton(_ sender: Any) {
        if self.timer == nil{
            nowIndex += 1
            
            if nowIndex == images.count{
                nowIndex=0
            }
            imageView.image=images[nowIndex]
        }
    }
    //戻る
    @IBAction func backButton(_ sender: Any) {
        if self.timer == nil{
            if nowIndex != 0{
                nowIndex -= 1
                imageView.image=images[nowIndex]
            }else{
                nowIndex=3
                imageView.image=images[nowIndex]
            }
        }
    }
    
    //再生
    @IBAction func shideShowButton(_ sender: Any) {
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeimage), userInfo: nil, repeats: true)
            startstopButton.setTitle("停止", for: .normal)
            nextButton.isEnabled = false
            backButton.isEnabled = false
        }else{
            self.timer.invalidate()
            self.timer=nil
            startstopButton.setTitle("再生", for: .normal)
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
    //indexを増やして画像を変更する
    @objc func changeimage() {
        nowIndex += 1
        
        if nowIndex == images.count{
            nowIndex=0
        }
        imageView.image=images[nowIndex]
    }
    


}

