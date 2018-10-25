//  
//  FeedModuleConfigurator.swift
//  MVC-IN-ACTION
//
//  Created by Maksim Vialykh on 25/10/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import UIKit

final class FeedModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? FeedViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: FeedViewController) {
        let model = FeedModel()
        model.output = viewController
        
        viewController.model = model
    }
    
}
