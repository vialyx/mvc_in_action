//  
//  DetailsViewController.swift
//  MVC-IN-ACTION
//
//  Created by Maksim Vialykh on 25/10/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    var model: DetailsModelInput!
    lazy var contentView: DetailsViewInput = { return view as! DetailsViewInput }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.display(model.item)
        title = "Second Controller"
        contentView.closeAction = { [unowned self] in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("navigation controller \(String(describing: navigationController?.viewControllers.count))")
    }
    
}

// MARK: - DetailsModelOutput
extension DetailsViewController: DetailsModelOutput {}

// MARK: - DetailsViewControllerInput
extension DetailsViewController: DetailsViewControllerInput {
    
    func set(_ item: FeedItem) {
        model.item = item
    }
    
}
