//
//  UIViewController+ActivityIndicator.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 03.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showActivityIndicator() {
        executeOnMainThread {
            self.removeActivityIndicator()
            
            self.view.isUserInteractionEnabled = false
            let activityIndicatorView = UIActivityIndicatorView(frame: self.view.bounds)
            activityIndicatorView.activityIndicatorViewStyle = .gray
            activityIndicatorView.center = self.view.center
            self.view.addSubview(activityIndicatorView)
            activityIndicatorView.startAnimating()
        }
    }
    
    func removeActivityIndicator() {
        executeOnMainThread {
            while let activityIndicator = self.view.subviews.first(where: { $0 is UIActivityIndicatorView }) {
                activityIndicator.removeFromSuperview()
            }
            self.view.isUserInteractionEnabled = true
        }
    }
}
