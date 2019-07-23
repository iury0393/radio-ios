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
        guard let url = URL(string: "http://www.facebook.com/") else {
            return
        }
        goToUrl(url)
    }
    
    @IBAction func btnInstagram() {
        guard let url = URL(string: "http://www.instagram.com/") else {
            return
        }
        goToUrl(url)
    }
    
    @IBAction func btnTwitter() {
        guard let url = URL(string: "http://www.twitter.com/") else {
            return
        }
        goToUrl(url)
    }
    
    @IBAction func btnYoutube() {
        guard let url = URL(string: "http://www.youtube.com/") else {
            return
        }
        goToUrl(url)
    }
    
    @IBAction func btnSite() {
        guard let url = URL(string: "Site") else {
            return
        }
        goToUrl(url)
    }
    
    @IBAction func goBack() {
        navigationController?.popViewController(animated: true)
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
