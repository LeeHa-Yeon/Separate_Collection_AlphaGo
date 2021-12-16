//
//  AnalyzeViewController.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이하연 on 2021/12/16.
//

import UIKit
import Then
import SnapKit
import Charts

class AnalyzeViewController: UIViewController {
    
    // MARK: - Declaration & Definitions
    let imagePredictor = ImagePredictor()
    let predictionsToShow = 6
    
    // MARK: - Components
    lazy var imgViewFrame = UIView().then {
        $0.backgroundColor = .clear
        $0.layer.borderWidth = 2.0
    }
    
    lazy var photoImg = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
    }
    
    lazy var explanationLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.numberOfLines = 0
    }
    
    lazy var resultView = UIView().then {
        $0.backgroundColor = .gray
        $0.alpha = 0.5
    }
    
    lazy var predictionLabel = UILabel().then {
        $0.text = "Predictions go here"
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.numberOfLines = 0
    }
    
    lazy var barChartView = BarChartView().then {
        $0.noDataText = "데이터가 없습니다."
        $0.noDataFont = .systemFont(ofSize: 20)
        $0.noDataTextColor = .lightGray
        $0.backgroundColor = .gray
    }
    

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        view.backgroundColor = .white
        view.addSubview(imgViewFrame)
        imgViewFrame.addSubview(photoImg)
        view.addSubview(explanationLabel)
        view.addSubview(resultView)
        resultView.addSubview(predictionLabel)
        view.addSubview(barChartView)
        
        imgViewFrame.snp.makeConstraints{
            $0.width.height.equalTo(120)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30.0)
            $0.leading.equalToSuperview().offset(20.0)
        }
        photoImg.snp.makeConstraints{
            $0.width.height.equalTo(100)
            $0.center.equalToSuperview()
        }
        explanationLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(10.0)
            $0.centerY.equalTo(imgViewFrame.snp.centerY)
            $0.leading.equalTo(imgViewFrame.snp.trailing).offset(20.0)
        }
        resultView.snp.makeConstraints{
            $0.top.equalTo(imgViewFrame.snp.bottom).offset(30.0)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(150)
        }
        predictionLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        barChartView.snp.makeConstraints{
            $0.top.equalTo(resultView.snp.bottom).offset(30.0)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(400)
        }
        
    }
    
    // MARK: - objc Functions
    
}
