//
//  Observable.swift
//  LazyBird
//
//  Created by 이숭인 on 2021/11/18.
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

