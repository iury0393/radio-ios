//
//  DetailsRecifeViewController.swift
//  recifefm
//
//  Created by Iury Vasconcelos on 16/07/2019.
//  Copyright © 2019 Sistema Verdes Mares. All rights reserved.
//

import UIKit

class DetailsRecifeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnFacebook() {
        print("Facebook")
        guard let url = URL(string: "http://www.facebook.com/") else {
            return //be safe
        }
        goToUrl(url)
    }
    
    @IBAction func btnInstagram() {
        print("Instagram")
        guard let url = URL(string: "http://www.instagram.com/") else {
            return //be safe
        }
        goToUrl(url)
    }
    
    @IBAction func btnTwitter() {
        print("Twitter")
        guard let url = URL(string: "http://www.twitter.com/") else {
            return //be safe
        }
        goToUrl(url)
    }
    
    @IBAction func btnYoutube() {
        print("Youtube")
        guard let url = URL(string: "http://www.youtube.com/recifefm") else {
            return //be safe
        }
        goToUrl(url)
    }
    
    @IBAction func btnSite() {
        print("RecifeFM")
        guard let url = URL(string: "http://www.google.com.br/") else {
            return //be safe
        }
        goToUrl(url)
    }

    
    func goToUrl (_ url:URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
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

}
