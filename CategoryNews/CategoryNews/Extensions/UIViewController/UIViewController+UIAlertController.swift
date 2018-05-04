//
//  UIViewController+UIAlertController.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 03.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import UIKit

extension UIViewController {
    
    typealias AlertActionBlock = (UIAlertController) -> ()
    
    func alertWithTitle(_ title: String? = nil, message: String? = nil, actionBlock: @escaping AlertActionBlock) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.view.tintColor = view.tintColor
        actionBlock(alertController)
        present(alertController, animated: true, completion: nil)
    }
    
}
