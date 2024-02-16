//
//  Observable.swift
//  MovieTrending
//
//  Created by Max Soiferman on 8/2/24.
//

import Foundation

class Observable <T> {
    
    var value: T? {
        didSet {
            self.listener?(self.value)
        }
    }
    
    init(_ value: T? = nil) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping ((T?) -> Void)) {
        listener(value)
        self.listener = listener
    }
    
}
 
