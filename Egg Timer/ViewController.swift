//
//  ViewController.swift
//  Egg Timer
//
//  Created by IMCS on 8/9/19.
//  Copyright © 2019 IMCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var time: Int = 0
    var timer = Timer()
    var status = "pause"
    
    @IBOutlet weak var MyToolbar: UIToolbar!
    let playBtn = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(playPauseActions(_:)))
    
    let pauseBtn = UIBarButtonItem(barButtonSystemItem: .pause, target: self, action: #selector(playPauseActions(_:)))
    
    @IBAction func decreaseAction(_ sender: Any) {
        time -= 10
        if time<0 {
            time = 0
        }
        updateDisplay()
    }
    
    @IBAction func increaseAction(_ sender: Any) {
        time += 10
        updateDisplay()
    }
    
    @IBOutlet weak var playPause: UIBarButtonItem!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func playPauseActions(_ sender: Any) {
        
       
       
        if status=="pause"{
        play()
        status = "play"
            
           
            
        }
        else if status=="play" {
            pause()
            status="pause"
            
           
        }
    }
    
    func play() {
         var image = self.MyToolbar.items
        image![2] = UIBarButtonItem(barButtonSystemItem: .pause, target: self, action: #selector(ViewController.playPauseActions(_:)))
        self.MyToolbar.setItems(image, animated: true)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
        
        
    }
    @IBAction func resetActions(_ sender: Any) {
        
            timer.invalidate()
            time = 0
            updateDisplay()
            status = "pause"
        
        var image = self.MyToolbar.items
        image![2] = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(ViewController.playPauseActions(_:)))
        self.MyToolbar.setItems(image, animated: true)
        
    }
    
    
    func pause() {
         var image = self.MyToolbar.items
        image![2] = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(ViewController.playPauseActions(_:)))
        
        self.MyToolbar.setItems(image, animated: true)
        timer.invalidate()
    }
    
    @objc func action() {

        time += 1
        updateDisplay()
}
    func updateDisplay() {
        timeLabel.text = String(time)
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

