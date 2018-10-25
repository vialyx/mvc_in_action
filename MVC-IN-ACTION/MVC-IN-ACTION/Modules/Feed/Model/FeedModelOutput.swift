//  
//  FeedModelOutput.swift
//  MVC-IN-ACTION
//
//  Created by Maksim Vialykh on 25/10/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

protocol FeedModelOutput: class {
    func modelDidLoad(_ items: [FeedItem])
    func modelDidFail(_ error: Error?)
}
