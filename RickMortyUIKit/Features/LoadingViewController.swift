//
//  LoadingViewController.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 18/10/23.
//

import UIKit

class LoadingViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .large)

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.7)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func hide() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
    static func show(in viewController: UIViewController) -> LoadingViewController {
        let loadingViewController = LoadingViewController()
        viewController.addChild(loadingViewController)
        loadingViewController.view.frame = viewController.view.frame
        viewController.view.addSubview(loadingViewController.view)
        loadingViewController.didMove(toParent: viewController)
        return loadingViewController
    }
}
