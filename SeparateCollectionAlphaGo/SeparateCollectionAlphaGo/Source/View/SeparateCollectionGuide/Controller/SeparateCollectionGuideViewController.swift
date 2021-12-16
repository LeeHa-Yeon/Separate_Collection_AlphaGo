//
//  SeparateCollectionGuideViewController.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/15.
//

import UIKit
import SnapKit
import Then

class SeparateCollectionGuideViewController: UIViewController {
    //MARK: - Properties
    let viewModel = SeparateCollectionGuideViewModel()
    //MARK: - UI Components
    
    let titleLabel = UILabel().then{
        $0.text = "분리배출 요령"
        $0.font = UIFont.TTFont(type: .SDBold, size: 40)
    }
    
    lazy var separationOfRecyclablesBtn = UIButton().then{
        $0.setTitle("이미지로 보기", for: .normal)
        $0.titleLabel?.font = UIFont.TTFont(type: .SDBold, size: 17)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.Background.darkGray02
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(separationOfRecyclablesPressed(_:)), for: .touchUpInside)
    }
    
    lazy var separationOfRecyclablesForTextBtn = UIButton().then{
        $0.setTitle("텍스트로 보기", for: .normal)
        $0.titleLabel?.font = UIFont.TTFont(type: .SDBold, size: 17)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.Background.darkGray02
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(separationOfRecyclablesForTextPressed(_:)), for: .touchUpInside)
    }
    
    lazy var ministryOfEnvironmentGuidelineBtn = UIButton().then{
        $0.setTitle("환경부 가이드라인", for: .normal)
        $0.titleLabel?.font = UIFont.TTFont(type: .SDBold, size: 17)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = UIColor.Background.darkGray02
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(ministryOfEnvironmentGuidelineBtnPressed(_:)), for: .touchUpInside)
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setUI()
        setNavigationItem()
    }
    
    //MARK: - Functions
    @objc func ministryOfEnvironmentGuidelineBtnPressed(_ sender: UIButton){
        //TODO: 화면 이동 - 환경부 분리배출 가이드라인
        exceptAlert()
    }
    
    @objc func separationOfRecyclablesPressed(_ sender: UIButton){
        //TODO: 화면 이동 - 이미지로 보기
        let imageDetailVC = ImageGuideDetailViewController()
        imageDetailVC.delegate = self.viewModel
        
        self.navigationController?.pushViewController(imageDetailVC, animated: true)
    }
    
    @objc func separationOfRecyclablesForTextPressed(_ sender: UIButton){
        //TODO: 화면 이동 - 텍스트로 보기
        let textDetailVC = TextGuideDetailViewController()
        textDetailVC.delegate = self.viewModel
        
        self.navigationController?.pushViewController(textDetailVC, animated: true)
    }
    
    func exceptAlert(){
        let alert = UIAlertController(title: "누르지마세요", message: "할까말까 고민중임니다\n환경부 분리배출 가이드라인 이미지들 넣을까해요.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "그래여", style: .default) { (ok) in
            
        }
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func setNavigationItem(){
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil) // navigationbar backbutton 설정
    }
    
    func setUI(){
        self.view.addSubview(titleLabel)
        self.view.addSubview(ministryOfEnvironmentGuidelineBtn)
        self.view.addSubview(separationOfRecyclablesBtn)
        self.view.addSubview(separationOfRecyclablesForTextBtn)
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(32.0)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(32.0)
        }
        
        ministryOfEnvironmentGuidelineBtn.snp.makeConstraints{
            $0.centerX.centerY.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(32.0)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-32.0)
            $0.height.equalTo(48.0)
        }
        
        separationOfRecyclablesBtn.snp.makeConstraints{
            $0.top.equalTo(ministryOfEnvironmentGuidelineBtn.snp.bottom).offset(16.0)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(32.0)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-32.0)
            $0.height.equalTo(48.0)
        }
        
        separationOfRecyclablesForTextBtn.snp.makeConstraints{
            $0.top.equalTo(separationOfRecyclablesBtn.snp.bottom).offset(16.0)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(32.0)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-32.0)
            $0.height.equalTo(48.0)
        }
    }
}

