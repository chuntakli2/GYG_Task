//
//  BaseViewController.swift
//  GYG_Task
//
//  Created by Chun Tak Li on 2/4/2019.
//  Copyright © 2019 Chun Tak Li. All rights reserved.
//

import UIKit

func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}

class BaseViewController: UIViewController {
    var statusBarStyle: UIStatusBarStyle = .default
    
    fileprivate var hasLoadedConstraints = false
    
    // MARK: - Initialisation
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    deinit {
        
    }
    
    // MARK: - Accessors

    // MARK: - Public Methods
    
    func setup() {
        self.setNeedsStatusBarAppearanceUpdate()
    }

    open func forceUpdateStatusBarStyle(_ style: UIStatusBarStyle) {
        self.statusBarStyle = style
        self.setNeedsStatusBarAppearanceUpdate()
    }

    // MARK: - Subviews
    
    func setupSubviews() {

    }

    override var prefersStatusBarHidden : Bool {
        return false
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return self.statusBarStyle
    }
    
    override func updateViewConstraints() {
        if (!self.hasLoadedConstraints) {
            
            self.hasLoadedConstraints = true
        }
        super.updateViewConstraints()
    }

    // MARK: - View lifecycle
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = APP_BACKGROUND_COLOUR
        self.view.tintColor = APP_FOREGROUND_COLOUR
        self.view.translatesAutoresizingMaskIntoConstraints = true
        
        self.extendedLayoutIncludesOpaqueBars = true
//        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
        
        self.setupSubviews()
        self.updateViewConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

