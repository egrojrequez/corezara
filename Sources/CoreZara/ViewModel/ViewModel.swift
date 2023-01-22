//
//  ViewModel.swift
//  rickmorty-cibernos
//
//  Created by Jorge Luis Requez Rodriguez on 22/01/23.
//

import Foundation
import SwiftUI

public protocol ViewModel: ObservableObject {
    /// Custom events that a view needs (getUsers, getCharacters...)
    associatedtype Event
    /// Custom View State to display view (Success, Error, Loading...)
    associatedtype State
    
    func input(_ event: Event)
}
