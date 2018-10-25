//
//  FeedTableViewDataSource.swift
//  MVC-IN-ACTION
//
//  Created by Maksim Vialykh on 25/10/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import UIKit

final class FeedTableViewDataSource: NSObject {

    var items: [FeedItem] = []
    
}

// MARK: - UITableViewDataSource
extension FeedTableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell: FeedTableViewCell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.reuseIdentifier) as! FeedTableViewCell
        cell.display(item)
        return cell
    }
    
}
