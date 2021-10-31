//
//  CustomAlert.swift
//  App
//
//  Created by Elaine Cecilio Sangali on 31/10/21.
//

import Foundation
import UIKit

class Alert {
    
    let controller:UIViewController
    let title: String
    var alert: UIAlertController?
    
    init(controller: UIViewController, title: String){
        self.controller = controller
        self.title = title
    }
    
    convenience init(controller: UIViewController){
        self.init(controller: controller, title: "Atenção")
    }
    
    func show(_ message: String){
        self.show(message, handler: nil)
    }
    
    func show(_ message: String, handler: ((UIAlertAction) -> Void)?){
        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert!.view.tintColor = UIColor.black
        
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: handler)
        
        alert!.addAction(ok)
        
        controller.present(alert!, animated: true, completion: nil)
    }
    
    func dismiss() {
        if alert != nil {
            alert!.dismiss(animated: false, completion: nil)
            alert = nil
        }
    }
}
