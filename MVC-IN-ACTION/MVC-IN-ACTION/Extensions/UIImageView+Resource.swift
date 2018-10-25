//
//  UIImageView+Resource.swift
//  MVC-IN-ACTION
//
//  Created by Maksim Vialykh on 25/10/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func load(_ resource: String?) {
        resource.flatMap {
            URL(string: $0).flatMap { url in
                DispatchQueue(label: "image.loading").sync { [weak self] in
                    guard let data = try? Data(contentsOf: url) else { return }
                    DispatchQueue.main.async {
                        self?.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
}
