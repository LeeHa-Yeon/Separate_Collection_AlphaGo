//
//  SeparateCollectionCell.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/16.
//

import UIKit
import SnapKit
import Then

class SeparateCollectionCell: UICollectionViewCell {
    //MARK: - Properties
    static let identifier = "separateCollectionCell"
    
    //MARK: - UI Components
    let titleLabel = UILabel().then{
        $0.text = "Dummy"
        $0.font = UIFont.TTFont(type: .SDBold, size: 17)
    }
    
    //MARK: - Life Cycle
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = .white
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    //MARK: - Functions
    func config(title: String){
        self.titleLabel.text = title
    }
    
    func setUI(){
        self.contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
