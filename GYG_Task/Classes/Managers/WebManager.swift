//
//  WebManager.swift
//  GYG_Task
//
//  Created by Chun Tak Li on 2/4/2019.
//  Copyright © 2019 Chun Tak Li. All rights reserved.
//

import Alamofire

class WebManager: NSObject {
    typealias ServiceResponse = (Any?, Int, Error?) -> Void
    typealias DownloadResponse = (URL?, Int, Error?) -> Void
    
    var isReachable: Bool {
        get {
            return self._isReachable
        }
    }
    
    fileprivate var _isReachable = false
    fileprivate var _isReachableOnEthernetOrWiFi = false
    
    // MARK: - Singleton Methods
    
    static let sharedInstance: WebManager = {
        let instance = WebManager()
        return instance
    }()
    
    // MARK: - Initialisation
    
    override init() {
        // perform some initialization here
    }
    
    // MARK: - Accessors
    
    fileprivate lazy var networkManager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.httpShouldSetCookies = false
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.timeoutIntervalForRequest = TIME_OUT_INTERVAL
        configuration.timeoutIntervalForResource = TIME_OUT_RESOURCE
        let manager = Alamofire.SessionManager(configuration: configuration)
        return manager
    }()
    
    fileprivate(set) lazy var reachabilityManager: Alamofire.NetworkReachabilityManager? = {
        let _reachabilityManager = Alamofire.NetworkReachabilityManager()
        _reachabilityManager?.listener = ({ (status: Alamofire.NetworkReachabilityManager.NetworkReachabilityStatus) in
            self._isReachable = (status == .reachable(.ethernetOrWiFi) || status == .reachable(.wwan))
            self._isReachableOnEthernetOrWiFi = (status == .reachable(.ethernetOrWiFi))
            //            NotificationCenter.default.post(name: Notification.Name(rawValue: REACHABILITY_UPDATED), object: nil)
        })
        return _reachabilityManager
    }()
    
    // MARK: - Public Methods
    
    func getRequest(urlRequest: URLRequestConvertible, onCompletion: @escaping ServiceResponse) {
        self.networkManager.request(urlRequest)
            .validate()
            .responseJSON { response in
                var statusCode = ERROR_STATUS_CODE
                if let tmpStatusCode = response.response?.statusCode {
                    statusCode = tmpStatusCode
                }
                switch response.result {
                case .success(let value):
                    onCompletion(value, statusCode, nil)
                case .failure(let error):
                    onCompletion(nil, statusCode, error)
                }
        }
    }
}
