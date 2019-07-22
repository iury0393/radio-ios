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
    
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var btnRadio: UIButton!
    let player = FRadioPlayer.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController: viewDidLoad.")
        player.delegate = self as? FRadioPlayerDelegate
        player.radioURL = URL(string: "http://zoeweb.net:8046")
        navBarButton()
        let navBarImage = UIImage(named: "navigationbar")
        self.navigationController?.navigationBar.setBackgroundImage(navBarImage, for: .default)
    }
    
    @IBAction func btnPlayPause() {
        player.togglePlaying()
        
        if player.isPlaying {
            print("Creating stream: stream created")
            
            let imagePause = UIImage(named: "player-pause")
            btnRadio.setBackgroundImage(imagePause, for: UIControl.State.normal)
            
            let imagePausePushed = UIImage(named: "player-pause-pushed")
            btnRadio.setBackgroundImage(imagePausePushed, for: UIControl.State.highlighted)
        } else {
            print("Destroying stream: stream destroyed")
            
            let imagePlay = UIImage(named: "player")
            btnRadio.setBackgroundImage(imagePlay, for: UIControl.State.normal)
            
            let imagePlayPushed = UIImage(named: "player-pushed")
            btnRadio.setBackgroundImage(imagePlayPushed, for: UIControl.State.highlighted)
        }
    }
    
    @IBAction func volumeSliderAction() {

        
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
        let about = DetailsRecifeViewController()
        if let navigation = navigationController {
            navigation.pushViewController(about, animated: true)
        } else {
            Alert(controller: self).show()
        }
    }
}
