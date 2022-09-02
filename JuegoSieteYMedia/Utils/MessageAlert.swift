//
//  MessageAlert.swift
//  JuegoSieteYMedia
//
//  Created by Eduardo Armas Garcia on 01/09/22.
//

import Foundation
import UIKit

class MessageAlert{
    
    static func show(title: String, message: String, viewController: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    static func showMessageWithAction(title: String, message: String, viewController: UIViewController, onOk: @escaping ((UIAlertAction) -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: onOk))
        viewController.present(alert, animated: true, completion: nil)
    }
}
