//
//  File.swift
//  
//
//  Created by Jorge Luis Requez Rodriguez on 23/01/23.
//

import Foundation
import SwiftUI

public struct CoreZara {
    
    public static func registerFonts() {
        // Just one Zara font added for now
        // We should loop all fonts
        ZaraFont.allCases.forEach {
            registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "otf")
        }
    }
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        bundle.url(forResource: fontName, withExtension: fontExtension)
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
            let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
            let font = CGFont(fontDataProvider) else {
                fatalError("Couldn't create font from filename: \(fontName) with extension \(fontExtension)")
        }
        
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
