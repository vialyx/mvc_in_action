//
//  UIAlertController+InfoPresentation.swift
//  MVC-IN-ACTION
//
//  Created by Maksim Vialykh on 25/10/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static func show(_ vc: UIViewController, error: Error?) {
        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
}
