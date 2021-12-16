//
//  ImageGuideDetailViewController.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/16.
//

import UIKit

class ImageGuideDetailViewController: UIViewController {
    //MARK: - Properties
    //MARK: - UI Components
    private let scrollView = UIScrollView().then{
        $0.contentInsetAdjustmentBehavior = .never
    }
    
    private let contentView = UIView().then{
        $0.backgroundColor = .white
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        
    }
    
    //MARK: - Functions
    
    
}
