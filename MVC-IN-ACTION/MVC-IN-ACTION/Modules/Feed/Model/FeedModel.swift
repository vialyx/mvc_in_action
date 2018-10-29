//  
//  FeedModel.swift
//  MVC-IN-ACTION
//
//  Created by Maksim Vialykh on 25/10/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import Foundation

enum FeedModelError: Error {
    case noResourceFile(String)
}

extension FeedModelError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .noResourceFile(let name):
            return "Resource \(name) file not exist"
        }
    }
    
}

final class FeedModel: FeedModelInput {
    
    weak var output: FeedModelOutput!
    
    func load() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            let fileName = "Feed"
            guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
                self?.output.modelDidFail(FeedModelError.noResourceFile(fileName))
                return
            }
            let url = URL(fileURLWithPath: path)
            do {
                let data = try Data(contentsOf: url)
                let items = try JSONDecoder().decode([FeedItem].self, from: data)
                self?.output.modelDidLoad(items)
            } catch {
                self?.output.modelDidFail(error)
            }
        }
    }
    
}
