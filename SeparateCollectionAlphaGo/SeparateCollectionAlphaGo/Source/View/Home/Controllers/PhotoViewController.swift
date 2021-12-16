//
//  PhotoViewController.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이하연 on 2021/12/16.
//

import UIKit
import SnapKit
import Then
import Alamofire

class PhotoViewController: UIViewController {
    
    // TODO: - 나중에 info.plist에 넣기
    private let apiKey: String = "cPs6pJefrpTBaBSaw8K2rL3a"
    
    // MARK: - Components
    private lazy var imageViewFrame = UIView().then {
        $0.backgroundColor = .clear
        $0.layer.borderWidth = 2.0
        }
    
    lazy var photoImageView = UIImageView().then {
        $0.backgroundColor = .gray
        $0.contentMode = .scaleAspectFill
    }
    
    lazy var photoButton = UIButton(frame: .zero).then {
        let image = #imageLiteral(resourceName: "photoAlbum")
        $0.setImage(image, for: .normal)
        $0.contentMode = .scaleAspectFill
        $0.addTarget(self, action: #selector(uploadPhoto), for: .touchUpInside)
        
    }
    lazy var removeButton = UIButton(frame: .zero).then {
        let image = #imageLiteral(resourceName: "removeBG")
        $0.setImage(image, for: .normal)
        $0.contentMode = .scaleAspectFill
        $0.addTarget(self, action: #selector(removeBgPhoto), for: .touchUpInside)
        
    }
    private lazy var analyzeBtn = UIButton().then {
        $0.setTitle("분석하기", for: .normal)
        $0.addTarget(self, action: #selector(analyzeBtnPressed(_:)), for: .touchUpInside)
        $0.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    private lazy var backBtn = UIButton().then {
        let image = #imageLiteral(resourceName: "xImg")
        $0.setImage(image, for: .normal)
        $0.addTarget(self, action: #selector(xBtnPressed(_:)), for: .touchUpInside)
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Functions
    func setUI(){
        view.backgroundColor = .white
        view.addSubview(backBtn)
        view.addSubview(removeButton)
        view.addSubview(photoButton)
        view.addSubview(imageViewFrame)
        imageViewFrame.addSubview(photoImageView)
        view.addSubview(analyzeBtn)
        
        view.subviews.forEach { view in view.translatesAutoresizingMaskIntoConstraints = false
            view.sizeToFit()
        }
        
        backBtn.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().offset(40)
            $0.height.width.equalTo(20)
        }
        
        imageViewFrame.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(photoButton.snp.bottom).offset(30)
            $0.height.equalTo(400)
            
        }
        
        removeButton.snp.makeConstraints{
            $0.width.height.equalTo(40)
            $0.trailing.equalToSuperview().offset(-40)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }
        
        photoButton.snp.makeConstraints{
            $0.width.height.equalTo(35)
            $0.trailing.equalTo(removeButton.snp.leading).offset(-10)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
        }
        
        photoImageView.snp.makeConstraints{
            $0.width.height.equalTo(300)
            $0.center.equalToSuperview()

        }
        analyzeBtn.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageViewFrame.snp.bottom).offset(50.0)
            $0.trailing.leading.equalToSuperview().inset(50)
        }

    }
    
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0 }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            }
        )
    }
    
    func failAlert(){
        let alert = UIAlertController(title: "실패", message: "사용 횟수 초과 ( 50회 한정 )", preferredStyle: UIAlertController.Style.alert)
                 
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in }
        alert.addAction(okAction)
                 
        present(alert, animated: false, completion: nil)
    }
    
    // MARK: - objc Functions
    @objc func xBtnPressed(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func uploadPhoto() {
        photoImageView.backgroundColor = .clear
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    @objc func removeBgPhoto() {
        showToast(message: "잠시만 기다려주세요", font: .systemFont(ofSize: 12.0))
        guard let jpgData = self.photoImageView.image?.jpegData(compressionQuality: 0.8) else { return }
        
        AF.upload(
            multipartFormData: { builder in
                builder.append(
                    jpgData,
                    withName: "image_file",
                    fileName: "file.jpg",
                    mimeType: "image/jpeg"
                )
            },
            to: URL(string: "https://api.remove.bg/v1.0/removebg")!,
            headers: [
                "X-Api-Key": apiKey
            ]
        ).responseJSON { json in
            if let imageData = json.data {
                guard let img = UIImage(data: imageData) else {
                    print("실패 - 한달 사용 횟수 초과 ( 50회 한정 ) ")
                    self.failAlert()
                    return
                }
                self.photoImageView.image = img
            }
        }
    }
    
    @objc func analyzeBtnPressed(_ sender: UIButton) {
        let analyzeVC = AnalyzeViewController()
        analyzeVC.userSelectedPhoto(photoImageView.image!)
        self.present(analyzeVC,animated: true,completion: nil)
    }

}

extension PhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoImageView.contentMode = .scaleAspectFit
            photoImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) { dismiss(animated: true, completion: nil)
    }
}
