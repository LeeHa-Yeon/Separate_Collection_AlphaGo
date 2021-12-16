//
//  Observable.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/16.
//

import UIKit

class Observable<T> {
    var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listener: ((T) -> Void)?) {
        self.listener = listener
    }
    
    init(value: T){
        self.value = value
    }
}

