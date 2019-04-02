//
//  BaseNavigationController.swift
//  GYG_Task
//
//  Created by Chun Tak Li on 2/4/2019.
//  Copyright © 2019 Chun Tak Li. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    // MARK: - Public Methods
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }
    
    override var shouldAutorotate : Bool {
        return !IS_SMALL_DEVICE
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return IS_SMALL_DEVICE ? .portrait : .allButUpsideDown
    }
}

