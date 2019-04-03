//
//  DataManager.swift
//  GYG_Task
//
//  Created by Chun Tak Li on 2/4/2019.
//  Copyright © 2019 Chun Tak Li. All rights reserved.
//

import SwiftyJSON

class DataManager: NSObject {
    typealias DataResponse = (Int, [Review]?, Error?) -> Void
    
    // MARK: - Singleton Methods
    
    static let sharedInstance: DataManager = {
        let instance = DataManager()
        return instance
    }()
    
    // MARK: - Initialisation
    
    override init() {
        // perform some initialization here
    }
    
    // MARK: - Accessors
    
    // MARK: - Events
    
    // MARK: - Public Methods
    
    func getReviews(count: Int = 10, page: Int = 0, rating: RatingFilter = .any, sortBy: SortBy = .date_of_review, direction: Direction = .desc, callback: @escaping DataResponse) -> Void {
        let reviewURL = String(format: REVIEW_URL, count, page, rating.rawValue, sortBy.rawValue, direction.rawValue)
        if let url = URL(string: reviewURL) {
            WebManager.sharedInstance.getRequest(urlRequest: URLRequest(url: url)) { (response, statusCode, error) in
                guard (error == nil) else { callback(0, nil, error); return }
                guard let response = response else { callback(0, nil, error); return }
                let responseJSON = JSON(response).dictionaryValue
                let status = responseJSON["status"]?.boolValue ?? false
                let totalReviewsComments = responseJSON["total_reviews_comments"]?.intValue ?? 0
                if (status == true) {
                    var reviews = [Review]()
                    let reviewsJSON = responseJSON["data"]?.arrayValue ?? []
                    for reviewJSON in reviewsJSON {
                        let review = Review()
                        review.reviewId = reviewJSON["review_id"].intValue
                        review.title = reviewJSON["title"].stringValue
                        review.message = reviewJSON["message"].stringValue
                        review.author = reviewJSON["author"].stringValue
                        review.rating = reviewJSON["rating"].stringValue
                        review.date = reviewJSON["date"].stringValue
                        review.reviewerCountry = reviewJSON["reviewerCountry"].stringValue
                        review.reviewerName = reviewJSON["reviewerName"].stringValue
                        review.reviewerProfilePhoto = reviewJSON["reviewerProfilePhoto"].stringValue
                        review.travelerType = reviewJSON["traveler_type"].stringValue
                        reviews.append(review)
                    }
                    callback(totalReviewsComments, reviews, nil)
                }
                callback(totalReviewsComments, nil, nil)
            }
        }
    }
}
