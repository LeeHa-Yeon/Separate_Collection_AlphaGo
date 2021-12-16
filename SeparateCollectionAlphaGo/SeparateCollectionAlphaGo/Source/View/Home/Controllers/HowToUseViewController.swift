//
//  HowToUseViewController.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이하연 on 2021/12/16.
//

import UIKit
import Then
import SnapKit

class HowToUseViewController: UIViewController {
    
    //MARK: - UIComponents
    
    private lazy var pageControl = UIPageControl().then {
        $0.numberOfPages = howToImges.count
        $0.pageIndicatorTintColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        $0.currentPageIndicatorTintColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
    }
    
    private lazy var scrollView = UIScrollView().then {
        $0.isScrollEnabled = true
        $0.isPagingEnabled = true
    }
    
    private lazy var scrollContentsView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    var howToImges = [UIImageView]()
    
    private lazy var firstImg = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "firstHow")
        $0.clipsToBounds = true
        howToImges.append($0)
    }
    
    private lazy var secondImg = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "secondHow")
        $0.clipsToBounds = true
        howToImges.append($0)
    }
    
    private lazy var thiredImg = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "thirdHow")
        $0.clipsToBounds = true
        howToImges.append($0)
    }
    
    private lazy var fourthImg = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "fourthHow")
        $0.clipsToBounds = true
        howToImges.append($0)
    }
    
    private lazy var footerView = UIView().then {
        $0.backgroundColor = #colorLiteral(red: 0.5053167343, green: 0.763967514, blue: 0.5148220658, alpha: 1)
    }
    
    private lazy var confirmBtn = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.addTarget(self, action: #selector(moveToRegisterVC), for: .touchUpInside)
        $0.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setScrollView()
    }
    
    //MARK: - Functions
    
    func setUI(){
//        view.backgroundColor = .black
        let viewFrameWidth = view.frame.width
        let viewFrameHeight = view.frame.height - 130
        
        scrollContentsView.addSubview(firstImg)
        scrollContentsView.addSubview(secondImg)
        scrollContentsView.addSubview(thiredImg)
        scrollContentsView.addSubview(fourthImg)
        scrollView.addSubview(scrollContentsView)
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        
        self.view.addSubview(footerView)
        footerView.addSubview(confirmBtn)
        
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview().offset(0)
        }
        
        firstImg.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0.0)
            $0.leading.equalToSuperview().inset(viewFrameWidth*CGFloat(0))
            $0.width.equalTo(viewFrameWidth)
            $0.height.equalTo(viewFrameHeight)
        }
        
        secondImg.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0.0)
            $0.leading.equalToSuperview().inset(viewFrameWidth*CGFloat(1))
            $0.width.equalTo(viewFrameWidth)
            $0.height.equalTo(viewFrameHeight)
        }
        
        thiredImg.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0.0)
            $0.leading.equalToSuperview().inset(viewFrameWidth*CGFloat(2))
            $0.width.equalTo(viewFrameWidth)
            $0.height.equalTo(viewFrameHeight)
        }
        
        fourthImg.snp.makeConstraints{
            $0.top.equalToSuperview().offset(0.0)
            $0.leading.equalToSuperview().inset(viewFrameWidth*CGFloat(3))
            $0.width.equalTo(viewFrameWidth)
            $0.height.equalTo(viewFrameHeight)
        }
        
        scrollContentsView.snp.makeConstraints{
            $0.edges.equalTo(0)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.width.equalTo(viewFrameWidth * CGFloat(howToImges.count))
            $0.height.equalTo(viewFrameHeight)
        }
        
        pageControl.snp.makeConstraints{
            $0.bottom.equalTo(footerView.snp.top).inset(-10)
            $0.centerX.equalToSuperview()
        }
        
        self.footerView.snp.makeConstraints{
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().offset(0.0)
            $0.height.equalTo(80.0)
        }
        
        confirmBtn.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview().inset(130)
            $0.centerY.equalToSuperview()
        }
    }
    
    func setScrollView(){
        scrollView.delegate = self
    }
    
    private func setPageControlSelectedPage(currentPage: Int) {
        pageControl.currentPage = currentPage
    }
    
    
    //MARK: - objc Functions
    
    @objc func moveToRegisterVC(){
        let transition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
    
}

extension HowToUseViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x / scrollView.frame.size.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
}
