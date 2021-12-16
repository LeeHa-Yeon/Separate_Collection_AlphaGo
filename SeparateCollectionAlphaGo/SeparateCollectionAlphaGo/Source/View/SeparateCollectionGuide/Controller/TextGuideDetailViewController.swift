//
//  TextGuideDetailViewController.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/16.
//

import UIKit

class TextGuideDetailViewController: UIViewController {
    //MARK: - Properties
    var delegate: SeparateCollectionTextProtocol?
    
    //MARK: - UI Components
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        
        setUI()
    }
    //MARK: - Functions
    func setUI(){
        
    }
}
