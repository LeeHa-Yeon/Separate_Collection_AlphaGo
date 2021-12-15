//
//  HomeView.swift
//  SeparateCollectionAlphaGo
//
//  Created by 송정훈 on 2021/12/11.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController{
    
    // MARK: - Components
    private lazy var titleLabel = UILabel().then {
        $0.text = "쓰레기를\n등록해주세요"
        $0.font = .systemFont(ofSize: 35, weight: .semibold)
        $0.numberOfLines = 0
    }
    
    private lazy var guideBtn = UIButton().then {
        let image = #imageLiteral(resourceName: "howToUse")
        $0.setImage(image, for: .normal)
        $0.addTarget(self, action: #selector(guideBtnPressed(_:)), for: .touchUpInside)
    }
    
    private lazy var trashImg = UIImageView().then {
        let image = #imageLiteral(resourceName: "trash")
        $0.image = image
        $0.contentMode = .scaleAspectFit
        $0.layer.borderWidth = 3.0
        
    }
    
    private lazy var cameraBtn = UIButton().then {
        $0.setTitle("사진찍기", for: .normal)
        $0.addTarget(self, action: #selector(cameraBtnPressed(_:)), for: .touchUpInside)
        $0.backgroundColor = #colorLiteral(red: 0.1661813557, green: 0.8038147688, blue: 0.4138007462, alpha: 1)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    private lazy var photoBtn = UIButton().then {
        $0.setTitle("사진 가져오기", for: .normal)
        $0.addTarget(self, action: #selector(photoBtnPressed(_:)), for: .touchUpInside)
        $0.backgroundColor = #colorLiteral(red: 0.5514806509, green: 0.805144608, blue: 0.5348007679, alpha: 1)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(guideBtn)
        view.addSubview(trashImg)
        view.addSubview(cameraBtn)
        view.addSubview(photoBtn)
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20.0)
            $0.leading.equalToSuperview().offset(40.0)
        }
        guideBtn.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20.0)
            $0.trailing.equalToSuperview().offset(-20.0)
            $0.width.height.equalTo(40)
        }
        trashImg.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(50.0)
            $0.width.height.equalTo(300)
        }
        
        cameraBtn.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(trashImg.snp.bottom).offset(50.0)
            $0.trailing.leading.equalToSuperview().inset(50)
        }
        photoBtn.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(cameraBtn.snp.bottom).offset(30.0)
            $0.trailing.leading.equalToSuperview().inset(50)
        }
        
    }
    
    // MARK: - objc Functions
    
    @objc func guideBtnPressed(_ sender: UIButton) {
        let howToUseVC = HowToUseViewController()
        howToUseVC.modalPresentationStyle = .fullScreen
        self.present(howToUseVC,animated: true,completion: nil)
    }
    
    @objc func cameraBtnPressed(_ sender: UIButton) {
        let cameraVC = CameraViewController()
        cameraVC.modalPresentationStyle = .fullScreen
        self.present(cameraVC,animated: true,completion: nil)
    }
    
    @objc func photoBtnPressed(_ sender: UIButton) {
        let photoVC = UINavigationController(rootViewController: PhotoViewController())
        photoVC.modalPresentationStyle = .fullScreen
        self.present(photoVC,animated: true,completion: nil)
    }
    
}
