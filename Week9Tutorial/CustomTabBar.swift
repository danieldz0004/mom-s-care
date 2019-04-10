//
//  CustomTabBarViewController.swift
//  Week9Tutorial
//
//  Created by Daniel Dz on 7/4/19.
//  Copyright © 2019 Jason Haasz. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        let thirdVC = ThirdViewController()
        let fourthVC = FourthViewController()
        let fifthVC = FifthViewController()
        let sixthVC = SixthViewController()

        
        firstVC.tabBarItem.title = "Home"
        secondVC.tabBarItem.title = "Info"
        thirdVC.tabBarItem.title = "Inquire"
        fourthVC.tabBarItem.title = "Map"
        fifthVC.tabBarItem.title = "Test"
        sixthVC.tabBarItem.title = "Test2"
        
        firstVC.tabBarItem.image = UIImage(named: "home")
        secondVC.tabBarItem.image = UIImage(named: "vaccination")
        thirdVC.tabBarItem.image = UIImage(named: "hospital")
        fourthVC.tabBarItem.image = UIImage(named: "map")
        fifthVC.tabBarItem.image = UIImage(named: "map")
        sixthVC.tabBarItem.image = UIImage(named: "map")
        
        
        viewControllers = [firstVC, secondVC, thirdVC, fourthVC, fifthVC, sixthVC]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
