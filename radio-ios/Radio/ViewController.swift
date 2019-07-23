//
//  ViewController.swift
//  recifefm
//
//  Created by Iury Vasconcelos on 10/07/2019.
//  Copyright © 2019 Sistema Verdes Mares. All rights reserved.
//

import UIKit
import FRadioPlayer
import MediaPlayer

class ViewController: UIViewController {
    
    @IBOutlet weak var btnRadio: UIButton!
    let player = FRadioPlayer.shared
    let wrapperView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 20))

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController: viewDidLoad.")
        player.delegate = self as? FRadioPlayerDelegate
        player.radioURL = URL(string: "URL da stream")
        navBarButton()
        setupRemoteTransportControls()
        setupNowPlaying()
        
        btnRadio.isEnabled = false
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { timer in
            self.btnRadio.isEnabled = true
        })
        
        view.backgroundColor = UIColor.clear
        view.addSubview(wrapperView)
        let volumeView = MPVolumeView(frame: wrapperView.bounds)
        wrapperView.addSubview(volumeView)
        
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        
        wrapperView.centerXAnchor.constraint(equalTo: btnRadio.centerXAnchor).isActive = true
        wrapperView.topAnchor.constraint(equalTo: btnRadio.topAnchor, constant: 250).isActive = true
        wrapperView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        wrapperView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let imagePause = UIImage(named: "player-pause")
        btnRadio.setBackgroundImage(imagePause, for: UIControl.State.normal)

        let imagePausePushed = UIImage(named: "player-pause-pushed")
        btnRadio.setBackgroundImage(imagePausePushed, for: UIControl.State.highlighted)
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
    
    private func navBarButton() {
        let button = UIButton(frame: CGRect(x: 10, y: 25, width: 30, height: 30))
        let btnImage = UIImage(named: "btn-close")
        button.setBackgroundImage(btnImage, for: .normal)
        button.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func showDetails() {
        let about = DetailsRecifeViewController()
        if let navigation = navigationController {
            navigation.pushViewController(about, animated: true)
        } else {
            Alert(controller: self).show()
        }
    }
    
    func setupRemoteTransportControls() {
        // Get the shared MPRemoteCommandCenter
        let commandCenter = MPRemoteCommandCenter.shared()
        
        // Add handler for Play Command
        commandCenter.playCommand.addTarget { [unowned self] event in
            if self.player.rate == 0.0 {
                self.player.play()
                return .success
            }
            return .commandFailed
        }
        
        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            if self.player.rate == 1.0 {
                self.player.pause()
                return .success
            }
            return .commandFailed
        }
    }
    
    func setupNowPlaying() {
        // Define Now Playing Info
        var nowPlayingInfo = [String : Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = "Radio"
        
        if let image = UIImage(named: "lockscreen") {
            nowPlayingInfo[MPMediaItemPropertyArtwork] =
                MPMediaItemArtwork(boundsSize: image.size) { size in
                    return image
            }
        }
        nowPlayingInfo[MPNowPlayingInfoPropertyPlaybackRate] = player.rate
        
        // Set the metadata
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
}
