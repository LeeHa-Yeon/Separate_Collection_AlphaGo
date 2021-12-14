//
//  TabbarViewController.swift
//  SeparateCollectionAlphaGo
//
//  Created by 이숭인 on 2021/12/11.
//

import UIKit
import SnapKit
import Then
import SwiftUI

class TabbarViewController: UITabBarController {
    
    //MARK: - Properties
    lazy var homeVC = UINavigationController(rootViewController: HomeViewController()).then{
        $0.tabBarItem = UITabBarItem(title: "",
                                     image: UIImage(systemName: "house"),
                                     selectedImage: UIImage(systemName: "house")?.withRenderingMode(.alwaysOriginal))
        $0.tabBarItem.imageInsets = UIEdgeInsets(top: 11, left: 0, bottom: -11, right: 0)
        $0.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 11)
        $0.navigationItem.largeTitleDisplayMode = .always
    }
    
    lazy var separateCollectionGuideVC = UINavigationController(rootViewController: SeparateCollectionGuideViewController()).then{
        $0.tabBarItem = UITabBarItem(title: "",
                                     image: UIImage(systemName: "book"),
                                     selectedImage: UIImage(systemName: "book")?.withRenderingMode(.alwaysOriginal))
        $0.tabBarItem.imageInsets = UIEdgeInsets(top: 11, left: 0, bottom: -11, right: 0)
        $0.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 11)
        $0.navigationItem.largeTitleDisplayMode = .always
    }
    
    lazy var wasteMapVC = UIHostingController(rootView: WasteMapView()).then{
        $0.tabBarItem = UITabBarItem(title: "",
                                     image: UIImage(systemName: "mappin.and.ellipse"),
                                     selectedImage: UIImage(systemName: "mappin.and.ellipse")?.withRenderingMode(.alwaysOriginal))
        $0.tabBarItem.imageInsets = UIEdgeInsets(top: 11, left: 0, bottom: -11, right: 0)
        $0.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 11)
        $0.navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTabbarUI()
        setTabBarLink()
    }
    
    private func setTabbarUI(){
        tabBar.isTranslucent = true
        tabBar.tintColor = UIColor.black
        tabBar.barTintColor = .white
        tabBar.unselectedItemTintColor = UIColor.white
//        UITabBar.appearance().shadowImage = UIImage() // tabbar shadow 지우기
    }
    
    private func setTabBarLink() {
        let homeVC = homeVC
        let separateCollectionGuideVC = self.separateCollectionGuideVC
        let wasteMapVC = wasteMapVC

        viewControllers = [homeVC,
                           separateCollectionGuideVC,
                           wasteMapVC]
    }

}
