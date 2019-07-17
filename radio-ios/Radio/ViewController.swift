//
//  ViewController.swift
//  recifefm
//
//  Created by Iury Vasconcelos on 10/07/2019.
//  Copyright © 2019 Sistema Verdes Mares. All rights reserved.
//

import UIKit
import FRadioPlayer

class ViewController: UIViewController {
    
    let player = FRadioPlayer.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController: viewDidLoad.")
        player.delegate = self as? FRadioPlayerDelegate
        navBarButton()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnPlay(_ sender: UIButton) {
        print("Toca música")
        player.radioURL = URL(string: "http://zoeweb.net:8046")
        player.play()
        player.togglePlaying()
    }
    
    @IBAction func btnPause(_ sender: UIButton) {
        print("Pausa música")
        player.stop()
    }
    

    
    
    
    
    
    
    private func navBarButton() {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "btn-close.png"), for: UIControl.State.normal)
        button.addTarget(self, action:#selector(ViewController.showDetails), for:.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    @objc func showDetails() {
        print("Ola")
    }
}
