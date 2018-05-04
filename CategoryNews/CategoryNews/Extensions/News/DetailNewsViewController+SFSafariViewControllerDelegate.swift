//
//  DetailNewsViewController+SFSafariViewControllerDelegate.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 05.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import UIKit
import SafariServices

extension DetailNewsViewController: SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
