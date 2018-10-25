//  
//  FeedModuleInitializer.swift
//  MVC-IN-ACTION
//
//  Created by Maksim Vialykh on 25/10/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import UIKit

final class FeedModuleInitializer: NSObject {
    
    @IBOutlet weak var viewController: FeedViewController!
    
    override func awakeFromNib() {
        let configurator = FeedModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
    
}
