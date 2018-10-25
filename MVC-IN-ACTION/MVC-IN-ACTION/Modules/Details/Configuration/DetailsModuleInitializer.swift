//  
//  DetailsModuleInitializer.swift
//  MVC-IN-ACTION
//
//  Created by Maksim Vialykh on 25/10/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import UIKit

final class DetailsModuleInitializer: NSObject {
    
    @IBOutlet weak var viewController: DetailsViewController!
    
    override func awakeFromNib() {
        let configurator = DetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
    
}
