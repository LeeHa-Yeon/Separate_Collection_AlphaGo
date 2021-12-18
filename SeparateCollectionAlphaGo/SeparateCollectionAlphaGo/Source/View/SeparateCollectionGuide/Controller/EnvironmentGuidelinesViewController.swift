//
//  EnvironmentGuidelinesViewController.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/19.
//

import UIKit

class EnvironmentGuidelinesViewController: UIViewController {
    //MARK: UI Components
    private let scrollView = UIScrollView()
    
    private let contentView = UIView().then{
        $0.backgroundColor = .white
    }
    
    lazy var stackView = UIStackView().then{
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 0.0
        $0.backgroundColor = .white
    }
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setUI()
        createImageViews()
    }
    
    //MARK: - Functions
    func createImageViews(){
        //TODO: 응답오는 image url 개수만큼 imageView 만들고, stackView에 추가하자
        
        for idx in 1...36{
            let dummyImageView = UIImageView().then{
                $0.image = UIImage(named: "guide\(idx)")?.resize(newWidth: self.view.frame.width)
            }
            
            self.stackView.addArrangedSubview(dummyImageView)
        }
    }
    
    func setUI(){
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
