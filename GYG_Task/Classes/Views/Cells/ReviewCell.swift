//
//  ReviewCell.swift
//  GYG_Task
//
//  Created by Chun Tak Li on 2/4/2019.
//  Copyright © 2019 Chun Tak Li. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {
    fileprivate let baseView = UIView()
    let ratingLabel = UILabel()
    let titleLabel = UILabel()
    let messageLabel = UILabel()
    let authorLabel = UILabel()
    let dateLabel = UILabel()
    
    fileprivate var hasLoadedConstraints = false
    
    // MARK: - Initialisation
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    // MARK: - Events
    
    // MARK: - Private Methods
    
    fileprivate func setup() {
        self.backgroundColor = APP_BACKGROUND_COLOUR
        self.selectionStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = true
        self.contentView.translatesAutoresizingMaskIntoConstraints = true
        self.setupSubviews()
        self.updateConstraints()
    }
    
    // MARK: - Subviews
    
    fileprivate func setupBaseView() {
        self.baseView.backgroundColor = APP_BACKGROUND_COLOUR
    }
    
    fileprivate func setupRatingLabel() {
        self.ratingLabel.numberOfLines = 0
        self.ratingLabel.textAlignment = .left
    }
    
    fileprivate func setupTitleLabel() {
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textAlignment = .left
    }

    fileprivate func setupMessageLabel() {
        self.messageLabel.numberOfLines = 0
        self.messageLabel.textAlignment = .left
    }

    fileprivate func setupAuthorLabel() {
        self.authorLabel.numberOfLines = 0
        self.authorLabel.textAlignment = .left
    }

    fileprivate func setupDateLabel() {
        self.dateLabel.numberOfLines = 0
        self.dateLabel.textAlignment = .left
    }

    fileprivate func setupSubviews() {
        self.setupBaseView()
        self.baseView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.baseView)
        
        self.setupRatingLabel()
        self.ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        self.baseView.addSubview(self.ratingLabel)
        
        self.setupTitleLabel()
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.baseView.addSubview(self.titleLabel)

        self.setupMessageLabel()
        self.messageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.baseView.addSubview(self.messageLabel)

        self.setupAuthorLabel()
        self.authorLabel.translatesAutoresizingMaskIntoConstraints = false
        self.baseView.addSubview(self.authorLabel)

        self.setupDateLabel()
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.baseView.addSubview(self.dateLabel)
    }
    
    override func updateConstraints() {
        if (!self.hasLoadedConstraints) {
            let views = ["base": self.baseView,
                         "rating": self.ratingLabel,
                         "title": self.titleLabel,
                         "message": self.messageLabel,
                         "author": self.authorLabel,
                         "date": self.dateLabel]
            
            let metrics = ["SPACING": GENERAL_SPACING,
                           "SMALL_SPACING": SMALL_SPACING,
                           "LARGE_SPACING": LARGE_SPACING]
            
            self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-(SPACING)-[base]-(SPACING)-|", options: .directionMask, metrics: metrics, views: views))
            
            self.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(SMALL_SPACING)-[base]-(SMALL_SPACING)-|", options: .directionMask, metrics: metrics, views: views))
            
            self.baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-(SPACING)-[rating]-(>=SPACING)-|", options: .directionMask, metrics: metrics, views: views))
            
            self.baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-(SPACING)-[title]-(>=SPACING)-|", options: .directionMask, metrics: metrics, views: views))

            self.baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-(SPACING)-[message]-(>=SPACING)-|", options: .directionMask, metrics: metrics, views: views))

            self.baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-(SPACING)-[author]-(>=SPACING)-|", options: .directionMask, metrics: metrics, views: views))

            self.baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-(>=SPACING)-[date]-(SPACING)-|", options: .directionMask, metrics: metrics, views: views))

            self.baseView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(SMALL_SPACING)-[rating]-(SPACING)-[title]-(SMALL_SPACING)-[message]-(SPACING)-[author]-(LARGE_SPACING)-[date]-(SMALL_SPACING)-|", options: .directionMask, metrics: metrics, views: views))

            self.hasLoadedConstraints = true
        }
        super.updateConstraints()
    }
    
    override class var requiresConstraintBasedLayout : Bool {
        return true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.ratingLabel.attributedText = nil
        self.titleLabel.attributedText = nil
        self.messageLabel.attributedText = nil
        self.authorLabel.attributedText = nil
        self.dateLabel.attributedText = nil
    }
}
