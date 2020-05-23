//
//  ViewController.swift
//  diceGame
//
//  Created by zoeli on 2020/5/16.
//  Copyright © 2020 zoeli. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var diceSumLabel: UILabel!
    
    @IBOutlet var dicesImageList: [UIImageView]!
    
    var diceSum = 0
   
    let imageName = ["dices_1", "dices_2", "dices_3", "dices_4", "dices_5", "dices_6"]
    
    let player = AVPlayer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
          
    }
    
    
    
    @IBAction func didTapChangeDiceButton(_ sender: Any) {
        
        self.playMusic()
        
        self.diceSum = 0
        
        for imageView in dicesImageList {

            imageView.image = UIImage(named: self.imageName.randomElement()!)
            
            self.sum(imageView: imageView)

        }
        
    }
    
    
    
    
    // 偵測晃動
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
       if motion == .motionShake {
        
        self.playMusic()
        
        self.diceSum = 0
        
          print("shake")
        
            for imageView in dicesImageList {

                imageView.image = UIImage(named: self.imageName.randomElement()!)
                
                self.sum(imageView: imageView)
            }
        
       }
    }
    
    
    func sum(imageView: UIImageView) {
        
        if imageView.image == UIImage(named: "dices_1")
            {
                self.diceSum += 1
            
            }else if imageView.image == UIImage(named: "dices_2") {
            
                self.diceSum += 2
                
            }else if imageView.image == UIImage(named: "dices_3") {
            
                self.diceSum += 3
            
            }else if imageView.image == UIImage(named: "dices_4") {
            
                self.diceSum += 4
            
            }else if imageView.image == UIImage(named: "dices_5") {
            
                self.diceSum += 5
            
            }else if imageView.image == UIImage(named: "dices_6") {
            
                self.diceSum += 6
            }
        
        
            self.diceSumLabel.text = "點數：\(self.diceSum)"

    }
    
    
    func playMusic() {
        
        let fileUrl = Bundle.main.url(forResource: "轉動音效", withExtension: "mp3")!
        let playerItem = AVPlayerItem(url: fileUrl)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        
    }

}

