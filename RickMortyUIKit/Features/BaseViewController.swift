//
//  BaseViewController.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 18/10/23.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var loadingViewController: LoadingViewController?
    
    func showLoading() {
        loadingViewController = LoadingViewController.show(in: self)
    }
    
    func hideLoading() {
        loadingViewController?.hide()
    }
}
