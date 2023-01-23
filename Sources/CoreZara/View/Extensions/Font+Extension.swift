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

public enum ZFont {
    
    case zaraH1
    case zaraH2
    case zaraH3
    case zaraFootnote
    
    private var name: String {
        return ZaraFont.regular.name
    }
    
    private var size: CGFloat {
        switch self {
        case .zaraH1: return 22
        case .zaraH2: return 20
        case .zaraH3: return 18
        case .zaraFootnote: return 14
        }
    }
    
    public var uiFont: UIFont? {
        return .init(name: self.name, size: self.size)
    }
    
    public var font: Font {
        return .custom(self.name, size: self.size)
    }
}
