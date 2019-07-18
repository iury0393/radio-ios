//
//  Alert.swift
//  recifefm
//
//  Created by Iury Vasconcelos on 18/07/2019.
//  Copyright © 2019 Sistema Verdes Mares. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    let controller:UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func show(_ title:String = "Desculpe", message:String = "Erro inesperado") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Entendi", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
}
