//
//  ZaraFont.swift
//  
//
//  Created by Jorge Luis Requez Rodriguez on 23/01/23.
//

import Foundation
import SwiftUI

public enum ZaraFont: String, CaseIterable {
    
    case regular = "OPTIBodoni"
    
    var name: String {
        switch self {
        case .regular:
            return "OPTIBodoni-Antiqua"
        }
    }
}

public enum PGFont {
    
    case h1
    case h2
    case h3
    case footnote
    
    private var name: String {
        return ZaraFont.regular.name
    }
    
    private var size: CGFloat {
        switch self {
        case .h1: return 22
        case .h2: return 20
        case .h3: return 18
        case .footnote: return 14
        }
    }
    
    public var uiFont: UIFont? {
        return .init(name: self.name, size: self.size)
    }
    
    public var font: Font {
        return .custom(self.name, size: self.size)
    }
}
