//
//  FeedTableViewCell.swift
//  MVC-IN-ACTION
//
//  Created by Maksim Vialykh on 25/10/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import UIKit

final class FeedTableViewCell: UITableViewCell {

    static var reuseIdentifier: String = "\(self)"
    
    @IBOutlet weak var titleL: UILabel!
    @IBOutlet weak var textL: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    
}

// MARK: - FeedItemViewType
extension FeedTableViewCell: FeedItemViewType {
    
    func display(_ item: FeedItem) {
        titleL.text = item.title
        textL.text = item.text
        imageV.load(item.image)
    }
    
}
