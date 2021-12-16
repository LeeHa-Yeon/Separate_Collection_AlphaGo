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
    let viewModel = TextGuideDetailViewModel()
    
    //MARK: - UI Components
    private let layout = UICollectionViewFlowLayout().then{
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 16
        $0.minimumInteritemSpacing = 16
    }
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then{
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: 0, left: 16.0, bottom: 16.0, right: 16.0)
        $0.register(SeparateCollectionCell.self, forCellWithReuseIdentifier: SeparateCollectionCell.identifier)
    }
    
    let typeTitleLabel = UILabel().then{
        $0.text = "종류"
        $0.font = UIFont.TTFont(type: .SDBold, size: 20)
    }
    
    let typeLabel = UILabel().then{
        $0.text = "항목을 선택해주세요."
        $0.font = UIFont.TTFont(type: .SDMed, size: 15)
        $0.numberOfLines = 0
    }
    
    let applicableItemsTitleLabel = UILabel().then{
        $0.text = "해당 품목"
        $0.font = UIFont.TTFont(type: .SDBold, size: 20)
    }
    
    let applicableItemsLabel = UILabel().then{
        $0.text = "항목을 선택해주세요."
        $0.font = UIFont.TTFont(type: .SDMed, size: 15)
        $0.numberOfLines = 0
    }
    
    let nonApplicableItemsTitleLabel = UILabel().then{
        $0.text = "해당하지 않는 품목"
        $0.font = UIFont.TTFont(type: .SDBold, size: 20)
    }
    
    let nonApplicableItemsLabel = UILabel().then{
        $0.text = "항목을 선택해주세요."
        $0.font = UIFont.TTFont(type: .SDMed, size: 15)
        $0.numberOfLines = 0
    }
    
    let dischargeGuidelinesTitleLabel = UILabel().then{
        $0.text = "배출 요령"
        $0.font = UIFont.TTFont(type: .SDBold, size: 20)
    }
    
    let dischargeGuidelinesLabel = UILabel().then{
        $0.text = "항목을 선택해주세요."
        $0.font = UIFont.TTFont(type: .SDMed, size: 15)
        $0.numberOfLines = 0
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setUI()
        setBind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        guard let delegate = delegate else {
            print("TextGuideDetailViewController delegate is nil")
            return
        }
        
        delegate.requestSeparateDischargeTextGuidelines()
    }
    
    //MARK: - Functions
    func setBind(){
        self.viewModel.classification.bind { text in
            self.typeLabel.text = text
        }
        
        self.viewModel.applicableItems.bind { text in
            self.applicableItemsLabel.text = text
        }
        
        self.viewModel.nonApplicableItems.bind { text in
            self.nonApplicableItemsLabel.text = text
        }
        
        self.viewModel.dischargeGuidelines.bind { text in
            self.dischargeGuidelinesLabel.text = text
        }
    }
    
    func setUI(){
        self.view.addSubview(collectionView)
        self.view.addSubview(typeTitleLabel)
        self.view.addSubview(typeLabel)
        self.view.addSubview(applicableItemsTitleLabel)
        self.view.addSubview(applicableItemsLabel)
        self.view.addSubview(nonApplicableItemsTitleLabel)
        self.view.addSubview(nonApplicableItemsLabel)
        self.view.addSubview(dischargeGuidelinesTitleLabel)
        self.view.addSubview(dischargeGuidelinesLabel)
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(200.0)
        }
        
        typeTitleLabel.snp.makeConstraints{
            $0.top.equalTo(collectionView.snp.bottom).offset(32.0)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16.0)
        }
        
        typeLabel.snp.makeConstraints{
            $0.top.equalTo(typeTitleLabel.snp.bottom).offset(16.0)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16.0)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-16.0)
        }
        
        applicableItemsTitleLabel.snp.makeConstraints{
            $0.top.equalTo(typeLabel.snp.bottom).offset(32.0)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16.0)
        }
        
        applicableItemsLabel.snp.makeConstraints{
            $0.top.equalTo(applicableItemsTitleLabel.snp.bottom).offset(16.0)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16.0)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-16.0)
        }
        
        nonApplicableItemsTitleLabel.snp.makeConstraints{
            $0.top.equalTo(applicableItemsLabel.snp.bottom).offset(32.0)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16.0)
        }
        
        nonApplicableItemsLabel.snp.makeConstraints{
            $0.top.equalTo(nonApplicableItemsTitleLabel.snp.bottom).offset(16.0)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16.0)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-16.0)
        }
        
        dischargeGuidelinesTitleLabel.snp.makeConstraints{
            $0.top.equalTo(nonApplicableItemsLabel.snp.bottom).offset(32.0)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16.0)
        }
        
        dischargeGuidelinesLabel.snp.makeConstraints{
            $0.top.equalTo(dischargeGuidelinesTitleLabel.snp.bottom).offset(16.0)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16.0)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-16.0)
        }
    }
}

extension TextGuideDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.collectionType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeparateCollectionCell.identifier, for: indexPath) as? SeparateCollectionCell else{
            return UICollectionViewCell()
        }
        cell.config(title: self.viewModel.collectionType[indexPath.row])
        
        return cell
    }
}
extension TextGuideDetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO: 일단 누른거 정보만 봐볼까?
        guard let delegate = delegate else {
            print("TextGuideDetailViewController didSelectItemAt delegate is nil")
            return
        }
        
        let typeOfRecycleable = delegate.separateResponse.value.typeOfRecycleable.filter{
            $0.classification == self.viewModel.collectionType[indexPath.row]
        }
        let separateDischargeTips = delegate.separateResponse.value.separateDischargeTips.filter{
            $0.classification == self.viewModel.collectionType[indexPath.row]
        }
        
        self.viewModel.classification.value = typeOfRecycleable[0].classification
        self.viewModel.applicableItems.value = typeOfRecycleable[0].applicableItems
        self.viewModel.nonApplicableItems.value = typeOfRecycleable[0].nonApplicableItems
        self.viewModel.dischargeGuidelines.value = separateDischargeTips[0].dischargeGuidelines
    }
}

extension TextGuideDetailViewController: UICollectionViewDelegateFlowLayout {

    // cell의 width, height 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = 150.0
        let height: CGFloat = width
        
        return CGSize(width: width, height: height)
    }
}
