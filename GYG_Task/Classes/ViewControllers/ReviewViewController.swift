//
//  ReviewViewController.swift
//  GYG_Task
//
//  Created by Chun Tak Li on 2/4/2019.
//  Copyright © 2019 Chun Tak Li. All rights reserved.
//

import UIKit

import Async

class ReviewViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    fileprivate let tableView = UITableView(frame: .zero, style: .plain)
    fileprivate let refreshControl = UIRefreshControl()
    
    fileprivate var reviews = [Review]()

    fileprivate var totalReviews = 0
    fileprivate var count = 10
    fileprivate var page = 0
    fileprivate var ratingFilter = 0
    fileprivate var sortBy: SortBy = .date_of_review
    fileprivate var direction: Direction = .desc
    fileprivate var isRequesting = false
    
    fileprivate var hasLoadedConstraints = false
    
    // MARK: - Initialisation
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        
    }
    
    // MARK: - Accessors
    
    // MARK: - Implementation of UITableViewDataSource Protocols
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath)
        if let reviewCell = cell as? ReviewCell {
            let review = self.reviews[indexPath.row]
            reviewCell.ratingLabel.attributedText = NSAttributedString(string: review.rating, attributes: ATTR_TEXT)
            reviewCell.titleLabel.attributedText = NSAttributedString(string: review.title, attributes: ATTR_TEXT)
            reviewCell.messageLabel.attributedText = NSAttributedString(string: review.message, attributes: ATTR_TEXT)
            reviewCell.authorLabel.attributedText = NSAttributedString(string: review.author, attributes: ATTR_TEXT)
            reviewCell.dateLabel.attributedText = NSAttributedString(string: review.date, attributes: ATTR_TEXT)
        }
        if (indexPath.row == (self.reviews.count - 1)) {
            Async.background { [unowned self] in
                self.getReviews()
            }
        }
        return cell
    }
    
    // MARK: - Implementation of UITableViewDelegate Protocols
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    // MARK: - Events
    
    @objc func sortButtonAction() {
        let sortAlertController = UIAlertController(title: NSLocalizedString("sort.title", comment: ""), message: nil, preferredStyle: .actionSheet)
        let sortByDateDescAction = UIAlertAction(title: NSLocalizedString("sortByDateDesc.title", comment: ""), style: .default, handler: { [unowned self] (action) in
            self.sortBy = .date_of_review
            self.direction = .desc
            self.forceReloadData()
        })
        let sortByDateAscAction = UIAlertAction(title: NSLocalizedString("sortByDateAsc.title", comment: ""), style: .default, handler: { [unowned self] (action) in
            self.sortBy = .date_of_review
            self.direction = .asc
            self.forceReloadData()
        })
        let sortByRatingDescAction = UIAlertAction(title: NSLocalizedString("sortByRatingDesc.title", comment: ""), style: .default, handler: { [unowned self] (action) in
            self.sortBy = .rating
            self.direction = .desc
            self.forceReloadData()
        })
        let sortByRatingAscAction = UIAlertAction(title: NSLocalizedString("sortByRatingAsc.title", comment: ""), style: .default, handler: { [unowned self] (action) in
            self.sortBy = .rating
            self.direction = .asc
            self.forceReloadData()
        })
        let cancelAction = UIAlertAction(title: NSLocalizedString("cancel.title", comment: ""), style: .cancel, handler: nil)
        sortAlertController.addAction(sortByDateDescAction)
        sortAlertController.addAction(sortByDateAscAction)
        sortAlertController.addAction(sortByRatingDescAction)
        sortAlertController.addAction(sortByRatingAscAction)
        sortAlertController.addAction(cancelAction)
        self.navigationController?.present(sortAlertController, animated: true, completion: nil)
    }
    
    @objc func refreshControlAction() {
        self.forceReloadData()
    }
    
    // MARK: - Public Methods
    
    override func setup() {
        super.setup()
    }
    
    // MARK: - Private Methods
    
    fileprivate func forceReloadData() {
        self.reviews.removeAll()
        self.tableView.reloadData()
        Async.background({ [unowned self] in
            self.getReviews()
        })
    }
    
    fileprivate func getReviews() {
        guard (self.isRequesting == false) else { return }
        self.isRequesting = true
        self.page = self.reviews.isEmpty ? 0 : (self.page + 1)
        DataManager.sharedInstance.getReviews(count: self.count, page: self.page, rating: self.ratingFilter, sortBy: self.sortBy, direction: self.direction) { (totalReviews: Int, reviews: [Review]?, error: Error?) in
            self.totalReviews = totalReviews
            if let reviews = reviews {
                self.reviews.append(contentsOf: reviews)
                Async.main({ [unowned self] in
                    self.refreshControl.endRefreshing()
                    self.tableView.reloadData()
                })
            }
            self.isRequesting = false
        }
    }
    
    // MARK: - Subviews
    
    fileprivate func setupTableView() {
        self.tableView.backgroundColor = APP_BACKGROUND_COLOUR
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableHeaderView = UIView()
        self.tableView.tableFooterView = UIView()
        self.tableView.estimatedRowHeight = GENERAL_CELL_HEIGHT
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.separatorStyle = .singleLine
        self.tableView.register(ReviewCell.self, forCellReuseIdentifier: "ReviewCell")
    }
    
    fileprivate func setupRefreshControl() {
        self.refreshControl.tintColor = APP_BUTTON_COLOUR
        self.refreshControl.addTarget(self, action: .refreshControlAction, for: .valueChanged)
    }

    override func setupSubviews() {
        super.setupSubviews()
        
        self.setupTableView()
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        
        self.setupRefreshControl()
        self.tableView.addSubview(self.refreshControl)
    }
    
    override func updateViewConstraints() {
        if (!self.hasLoadedConstraints) {
            let views = ["table": self.tableView]
            
            self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[table]|", options: .directionMask, metrics: nil, views: views))
            
            self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[table]|", options: .directionMask, metrics: nil, views: views))
            
            self.hasLoadedConstraints = true
        }
        super.updateViewConstraints()
    }
    
    // MARK: - View lifecycle
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sortBarButtonItem = UIBarButtonItem(title: NSLocalizedString("sort.title", comment: ""), style: .plain, target: self, action: .sortButtonAction)
        self.navigationItem.rightBarButtonItem = sortBarButtonItem
        
        Async.background { [unowned self] in
            self.getReviews()
        }
    }
}

private extension Selector {
    static let sortButtonAction = #selector(ReviewViewController.sortButtonAction)
    static let refreshControlAction = #selector(ReviewViewController.refreshControlAction)
}
