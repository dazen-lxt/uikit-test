//
//  ListBuilder.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 18/10/23.
//

import CoreData
import Foundation
import UIKit

final class ListBuilder {
    
    class func viewController() -> ListViewController {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("No se pudo obtener el viewContext de Core Data")
        }
        let viewController = ListViewController()
        let localRepository = LocalItemRepository(coreDataViewContext: appDelegate.viewContext)
        let remoteRepository = RemoteItemRepository(apiClient: ApiClientImpl())
        let interactor = ListInteractor(localRepository: localRepository, remoteRepository: remoteRepository)
        let presenter = ListPresenter()
        let router = ListRouter()
        viewController.title = "Items"
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }
    
}
