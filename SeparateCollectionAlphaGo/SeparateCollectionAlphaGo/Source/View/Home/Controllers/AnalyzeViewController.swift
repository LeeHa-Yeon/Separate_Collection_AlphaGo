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
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        // 데이터 생성
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "정확도")
        
        // 차트 컬러
        chartDataSet.colors = [.systemBlue]
        
        // 데이터 삽입
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        
        
        // 선택 안되게
        chartDataSet.highlightEnabled = false
        // 줌 안되게
        barChartView.doubleTapToZoomEnabled = false
        
        
        // X축 레이블 위치 조정
        barChartView.xAxis.labelPosition = .bottom
        // X축 레이블 포맷 지정
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: ImagePredictor.typeArr)
        
        
        // X축 레이블 갯수 최대로 설정 (이 코드 안쓸 시 Jan Mar May 이런식으로 띄엄띄엄 조금만 나옴)
        barChartView.xAxis.setLabelCount(dataPoints.count, force: false)
        
        // 오른쪽 레이블 제거
        barChartView.rightAxis.enabled = false
        
        // 기본 애니메이션
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        // 옵션 애니메이션
        //barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
        
        
        // 리미트라인
        let ll = ChartLimitLine(limit: 50.0, label: "Precision")
        barChartView.leftAxis.addLimitLine(ll)
        
        
        // 맥시멈
        barChartView.leftAxis.axisMaximum = 100
        // 미니멈
        barChartView.leftAxis.axisMinimum = 0
        
        
        // 백그라운드컬러
        barChartView.backgroundColor = .clear
        
    }
    
}


extension AnalyzeViewController {
    // MARK: Main storyboard updates
    /// Updates the storyboard's image view.
    /// - Parameter image: An image.
    func updateImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.photoImg.image = image
        }
    }
    
    /// Updates the storyboard's prediction label.
    /// - Parameter message: A prediction or message string.
    /// - Tag: updatePredictionLabel
    func updatePredictionLabel(_ message: String) {
        DispatchQueue.main.async {
            self.predictionLabel.text = message
        }
    }
    /// Notifies the view controller when a user selects a photo in the camera picker or photo library picker.
    /// - Parameter photo: A photo from the camera or photo library.
    func userSelectedPhoto(_ photo: UIImage) {
        updateImage(photo)
        updatePredictionLabel("Making predictions for the photo...")
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.classifyImage(photo)
            DispatchQueue.main.async {
                self.explanationLabel.text = "\(ImagePredictor.typeArr[0])가(이) 전체 중에 \n\(ImagePredictor.valueArr[0])%로 가장 높게 분석됨.\n올바르게 분리수거해주세요."
                self.setChart(dataPoints: ImagePredictor.typeArr, values: ImagePredictor.valueArr)
                ImagePredictor.typeArr.removeAll()
                ImagePredictor.valueArr.removeAll()
            }
        }
        
        
    }
    
}

extension AnalyzeViewController {
    // MARK: Image prediction methods
    /// Sends a photo to the Image Predictor to get a prediction of its content.
    /// - Parameter image: A photo.
    private func classifyImage(_ image: UIImage) {
        do {
            try self.imagePredictor.makePredictions(for: image,
                                                       completionHandler: imagePredictionHandler)
        } catch {
            print("Vision was unable to make a prediction...\n\n\(error.localizedDescription)")
        }
    }
    
    /// The method the Image Predictor calls when its image classifier model generates a prediction.
    /// - Parameter predictions: An array of predictions.
    /// - Tag: imagePredictionHandler
    private func imagePredictionHandler(_ predictions: [ImagePredictor.Prediction]?) {
        guard let predictions = predictions else {
            updatePredictionLabel("No predictions. (Check console log.)")
            return
        }
        
        let formattedPredictions = formatPredictions(predictions)
        let predictionString = formattedPredictions.joined(separator: "\n")
        updatePredictionLabel(predictionString)
    }
    
    /// Converts a prediction's observations into human-readable strings.
    /// - Parameter observations: The classification observations from a Vision request.
    /// - Tag: formatPredictions
    private func formatPredictions(_ predictions: [ImagePredictor.Prediction]) -> [String] {
        // Vision sorts the classifications in descending confidence order.
        let topPredictions: [String] = predictions.prefix(predictionsToShow).map { prediction in
            var name = prediction.classification
            
            // For classifications with more than one name, keep the one before the first comma.
            if let firstComma = name.firstIndex(of: ",") {
                name = String(name.prefix(upTo: firstComma))
            }
            
            return "\(name) - \(prediction.confidencePercentage)%"
        }
        
        return topPredictions
    }
}
