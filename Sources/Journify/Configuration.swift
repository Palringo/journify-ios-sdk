//
//  Configuration.swift
//  analytics-swift
//
//

import Foundation
#if os(Linux)
import FoundationNetworking
#endif

// MARK: - Internal Configuration

public class Configuration {
    internal struct Values {
        var writeKey: String
        var application: Any? = nil
        var trackApplicationLifecycleEvents: Bool = true
        var flushAt: Int = 20
        var flushInterval: TimeInterval = 30
        var apiHost: String = HTTPClient.getDefaultAPIHost()
        var requestFactory: ((URLRequest) -> URLRequest)? = nil
        var errorHandler: ((Error) -> Void)? = nil
    }
    
    internal var values: Values

    public init(writeKey: String) {
        self.values = Values(writeKey: writeKey)
    }
}


// MARK: - Analytics Configuration

public extension Configuration {
    @discardableResult
    func application(_ value: Any?) -> Configuration {
        values.application = value
        return self
    }
    
    @discardableResult
    func trackApplicationLifecycleEvents(_ enabled: Bool) -> Configuration {
        values.trackApplicationLifecycleEvents = enabled
        return self
    }
    
    @discardableResult
    func flushAt(_ count: Int) -> Configuration {
        values.flushAt = count
        return self
    }
    
    @discardableResult
    func flushInterval(_ interval: TimeInterval) -> Configuration {
        values.flushInterval = interval
        return self
    }
    
    @discardableResult
    func apiHost(_ value: String) -> Configuration {
        values.apiHost = value
        return self
    }
    
    @discardableResult
    func requestFactory(_ value: @escaping (URLRequest) -> URLRequest) -> Configuration {
        values.requestFactory = value
        return self
    }
    
    @discardableResult
    func errorHandler(_ value: @escaping (Error) -> Void) -> Configuration {
        values.errorHandler = value
        return self
    }
}

extension Journify {
    func configuration<T>(valueFor: () -> T) -> T {
        return valueFor()
    }
}
