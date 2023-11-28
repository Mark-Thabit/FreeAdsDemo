//
//  Reusable.swift
//  FreeAdsDemo
//
//  Created by Mark Thabit on 28/11/2023.
//

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

typealias NibReusable = Reusable & NibLoadable

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
