//  
//  FeedView.swift
//  MVC-IN-ACTION
//
//  Created by Maksim Vialykh on 25/10/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import UIKit

protocol FeedViewInput: class {
    var itemAction: ((FeedItem) -> Void)? { get set }
    var dataSource: FeedTableViewDataSource! { get set }
    func activity(_ show: Bool)
    func display(_ items: [FeedItem])
}

final class FeedView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - FeedViewInput
    var itemAction: ((FeedItem) -> Void)?
    var dataSource: FeedTableViewDataSource! {
        didSet {
            tableView.dataSource = dataSource
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.delegate = self
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: FeedTableViewCell.reuseIdentifier)
    }
    
}

// MARK: - FeedViewInput
extension FeedView: FeedViewInput {
    
    func activity(_ show: Bool) {
        show ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
    func display(_ items: [FeedItem]) {
        dataSource.items = items
        tableView.reloadData()
    }
    
}

// MARK: - UITableViewDelegate
extension FeedView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = dataSource.items[indexPath.row]
        itemAction?(item)
    }
    
}
