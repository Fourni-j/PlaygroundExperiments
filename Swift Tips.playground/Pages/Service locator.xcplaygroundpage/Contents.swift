//: [Previous](@previous)

import Foundation

/* Service locator pattern implementation */

class ServiceLocator {
    
    private (set) var registry: [String: Any] = [:]

    func registerService<T>(service: T) {
        let key = "\(T.self)"
        registry[key] = service
    }
    
    func tryGetService<T>() -> T? {
        let key = "\(T.self)"
        return registry[key] as? T
    }
    
    func getService<T>() -> T {
        let key = "\(T.self)"
        return registry[key] as! T
    }
}

/* Implementation for example purpose */

protocol NetworkService {
    func fetch()
}

class FirebaseService: NetworkService {
    func fetch() {
        print("fetch from firebase")
    }
}

class GatewayService: NetworkService {
    func fetch() {
        print("fetch from gateway")
    }
}

class ProfilViewModel {
    var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

final class ProfilViewModelFactory {
    class func createProfilViewModel(serviceLocator: ServiceLocator) -> ProfilViewModel {
        let profilViewModel = ProfilViewModel(networkService: serviceLocator.getService())
        return profilViewModel
    }
}

/* Usage example */

let serviceLocator = ServiceLocator()

// Register services
serviceLocator.registerService(service: FirebaseService() as NetworkService)

// Inject the service locator into the factory
let profilViewModel = ProfilViewModelFactory.createProfilViewModel(serviceLocator: serviceLocator)

// view model network service is the one registered into the service locator
profilViewModel.networkService

/*
    Prefer adding service locator as an explicit parameter of factories
    Avoid using service locator as a Singleton and inside your unit tests.
 */

/*
 https://stackoverflow.com/questions/34406817/service-locator-pattern-in-swift
 https://badootech.badoo.com/singleton-service-locator-and-tests-in-ios-d69484e88944
 */

//: [Next](@next)
