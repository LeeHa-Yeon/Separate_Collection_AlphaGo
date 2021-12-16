//
//  CameraViewController.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이하연 on 2021/12/16.
//

import UIKit
import AVFoundation
import Photos
import SnapKit
import Then

class CameraViewController: UIViewController {
    
    // MARK: - Declaration & Definitions
    
    let captureSession = AVCaptureSession()
    var videoDeviceInput: AVCaptureDeviceInput!
    let photoOutput = AVCapturePhotoOutput()
    
    // 비디오 프로세싱이 일어날 별도의 큐를 생성
    let sessionQueue = DispatchQueue(label: "session Queue")
    // 디바이스를 찾는 것을 도와줄 객체 생성
    let videoDeviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera, .builtInWideAngleCamera, .builtInTrueDepthCamera], mediaType: .video, position: .unspecified)
    
    // MARK: - Components
    
    private lazy var backBtn = UIButton().then {
        let image = #imageLiteral(resourceName: "xImg")
        $0.setImage(image, for: .normal)
        $0.addTarget(self, action: #selector(xBtnPressed(_:)), for: .touchUpInside)
    }
    
    private lazy var photoLibraryButton = UIButton().then {
        let image = #imageLiteral(resourceName: "capturePhoto")
        $0.setImage(image, for: .normal)
        $0.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        $0.layer.borderWidth = 1
    }
    let previewView =  PreviewView().then {
        $0.backgroundColor = .gray
    }
    private lazy var captureButton = UIButton().then {
        let image = #imageLiteral(resourceName: "capture")
        $0.setImage(image, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        $0.alpha = 0.5
        $0.layer.cornerRadius = 33
        $0.layer.masksToBounds = true
        $0.addTarget(self, action: #selector(capturePhoto(_:)), for: .touchUpInside)
    }
    //    private var blurBGView: UIVisualEffectView!
    private lazy var switchButton = UIButton().then {
        let image = #imageLiteral(resourceName: "front")
        $0.setImage(image, for: .normal)
        $0.layer.cornerRadius = $0.bounds.height / 2
        $0.layer.masksToBounds = true
        $0.addTarget(self, action: #selector(switchCamera(_:)), for: .touchUpInside)
    }

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Functions
    
    func setUI(){
        //TODO: - 레이아웃 잡기
        view.addSubview(previewView)
        view.addSubview(captureButton)
        view.addSubview(switchButton)
        view.addSubview(photoLibraryButton)
        view.addSubview(backBtn)
        
        previewView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        switchButton.snp.makeConstraints{
            $0.width.height.equalTo(45)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        captureButton.snp.makeConstraints{
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            $0.width.height.equalTo(65)
        }
        
        photoLibraryButton.snp.makeConstraints{
            $0.centerY.equalTo(captureButton)
            $0.width.height.equalTo(40)
            $0.trailing.equalTo(captureButton.snp.leading).offset(-50)
        }
        
        backBtn.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().offset(40)
            $0.height.width.equalTo(20)
        }
    }
    
    // MARK: - objc Functions
    
    @objc func xBtnPressed(_ sender: UIButton){
    }
    
    @objc func switchCamera(_ sender: UIButton){
    }
    
    @objc func capturePhoto(_ sender: UIButton){
    }
 
}
