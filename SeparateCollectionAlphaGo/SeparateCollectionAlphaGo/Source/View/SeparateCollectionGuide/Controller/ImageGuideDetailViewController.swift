//
//  ImageGuideDetailViewController.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/16.
//

import UIKit
import SnapKit
import Then
import Kingfisher

class ImageGuideDetailViewController: UIViewController {
    //MARK: - Properties
    var delegate: SeparateCollectionImageProtocol?
    
    //MARK: - UI Components
    private let scrollView = UIScrollView()
    
    private let contentView = UIView().then{
        $0.backgroundColor = .white
    }
    
    lazy var stackView = UIStackView().then{
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 0.0
        $0.backgroundColor = .white
        $0.addArrangedSubview(dummyView)
        $0.addArrangedSubview(dummyView)
    }
    
    let dummyView = UIView().then{
        $0.backgroundColor = .blue
    }
    
    //TODO: imageView 8개 넣어야함 ㅠ
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        guard let delegate = delegate else {
            print("ImageGuideDetailViewController delegate is nil")
            return
        }
        
        delegate.requestRecyclingSeparateDischargeGuidelines {
            delegate.requestSeparateDischargeGuidelines{
                //TODO: image 생성
                self.createImageView(cnt: delegate.separateDischargeTipUrls.count +
                                     delegate.recyclingSeparateDischargeUrls.count,
                                     urls: delegate.separateDischargeTipUrls +
                                     delegate.recyclingSeparateDischargeUrls)
            }
        }
        
    }
    
    //MARK: - Functions
    func createImageView(cnt: Int, urls: [String]){
        //TODO: 응답오는 image url 개수만큼 imageView 만들고, stackView에 추가하자
        print("cnt --> \(cnt)")
        for idx in 0..<cnt{
            let dummyImageView = UIImageView()
            
            dummyImageView.kf.setImage(with: URL(string: urls[idx])){ result in
                switch result{
                case .success:
                    dummyImageView.image = dummyImageView.image?.resize(newWidth: self.view.frame.width)
                case .failure(let error):
                    print("error -> \(error.localizedDescription)")
                }
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
