//  
//  FeedViewController.swift
//  MVC-IN-ACTION
//
//  Created by Maksim Vialykh on 25/10/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import UIKit

final class FeedViewController: UIViewController {
    
    var model: FeedModelInput!
    lazy var contentView: FeedViewInput = { return view as! FeedViewInput }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.dataSource = FeedTableViewDataSource()
        contentView.itemAction = { [unowned self] item in
            self.performSegue(withIdentifier: "showDetails", sender: item)
        }
        contentView.activity(true)
        model.load()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails",
            let controller = segue.destination as? DetailsViewControllerInput,
            let item = sender as? FeedItem {
            controller.set(item)
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {}
    
}

// MARK: - FeedModelOutput
extension FeedViewController: FeedModelOutput {
    
    func modelDidFail(_ error: Error?) {
        contentView.activity(false)
        UIAlertController.show(self, error: error)
    }
    
    func modelDidLoad(_ items: [FeedItem]) {
        contentView.activity(false)
        contentView.display(items)
    }
    
}

// MARK: - FeedViewControllerInput
extension FeedViewController: FeedViewControllerInput {}
