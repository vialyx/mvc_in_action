//  
//  DetailsModuleConfigurator.swift
//  MVC-IN-ACTION
//
//  Created by Maksim Vialykh on 25/10/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import UIKit

final class DetailsModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? DetailsViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: DetailsViewController) {
        let model = DetailsModel()
        model.output = viewController
        
        viewController.model = model
    }
    
}
