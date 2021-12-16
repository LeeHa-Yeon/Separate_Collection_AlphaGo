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
        setInit()
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
    
    func setInit(){
        previewView.session = captureSession
        sessionQueue.async {
            self.setupSession()
            self.startSession()
        }
    }
    
    // MARK: - objc Functions
    
    @objc func xBtnPressed(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func switchCamera(_ sender: UIButton){
    }
    
    @objc func capturePhoto(_ sender: UIButton){
    }
 
}

extension CameraViewController {
    func setupSession(){
        captureSession.sessionPreset = .photo
        captureSession.beginConfiguration()
        // 구성하는 코드 부분
        
        // Add Video Input
        do {
            var defaultVideoDevice: AVCaptureDevice?
            if let dualCameraDevice = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) {
                defaultVideoDevice = dualCameraDevice
            } else if let backCameraDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) {
                defaultVideoDevice = backCameraDevice
            } else if let frontCameraDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) {
                defaultVideoDevice = frontCameraDevice
            }
            
            guard let camera = defaultVideoDevice else {
                captureSession.commitConfiguration()
                return
            }
            
            let videoDeviceInput = try AVCaptureDeviceInput(device: camera)
            
            // 넣기 전에 DeviceInput을 session에 넣을 수 있는지 물어봐야한다.
            if captureSession.canAddInput(videoDeviceInput) {
                // 넣을 수 있다면 그제서야 addInput을 진행
                captureSession.addInput(videoDeviceInput)
                self.videoDeviceInput = videoDeviceInput
            } else {
                captureSession.commitConfiguration()
                return
            }
        } catch {
            captureSession.commitConfiguration()
            return
        }
        
        
        // - ADD photo Output : 사진을 찍어서 저장할테니까
        photoOutput.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])], completionHandler: nil)
        if captureSession.canAddOutput(photoOutput) {
            captureSession.addOutput(photoOutput)
        } else {
            captureSession.commitConfiguration()
            return
        }
        
        captureSession.commitConfiguration()
    }
    
    func startSession(){
        
        // captureSession이 실행중이 아닐 때 실행시키라고 하기
        if !captureSession.isRunning {
            sessionQueue.async {
                self.captureSession.startRunning()
            }
        }
        
    }
    
    func stopSession(){
        // captureSession이 멈춰있지 않을 때 ( 즉, 실행중일 때 ) 멈추게 하기
        if captureSession.isRunning {
            sessionQueue.async {
                self.captureSession.stopRunning()
            }
        }
    }
}


extension CameraViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        // capturePhoto delegate method 구현
        print("추후 수정")
    }
}
