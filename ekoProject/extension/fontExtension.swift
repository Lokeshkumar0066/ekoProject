//
//  fontExtension.swift
//  ekoProject
//
//  Created by Lokesh on 21/01/20.
//  Copyright © 2020 Lokesh. All rights reserved.
//

import UIKit

extension UIFont {
    func dynamicFontForHeading() -> UIFont{
        guard let customFont = UIFont(name: "SanFranciscoDisplay-Bold", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "SanFranciscoDisplay" font.
        Make sure the font file is included in the project and the font name is spelled correctly.
        """
            )
        }
        return customFont
    }
    
    func dynamicFontForFootNote() -> UIFont{
        guard let customFont = UIFont(name: "SanFranciscoDisplay-Medium", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "SanFranciscoDisplay" font.
        Make sure the font file is included in the project and the font name is spelled correctly.
        """
            )
        }
        return customFont
    }
    
    func dynamicFontForFootNoteTwo() -> UIFont{
        guard let customFont = UIFont(name: "SanFranciscoDisplay-Light", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "SanFranciscoDisplay" font.
        Make sure the font file is included in the project and the font name is spelled correctly.
        """
            )
        }
        return customFont
    }
    
    func dynamicFontForBody() -> UIFont{
        guard let customFont = UIFont(name: "SanFranciscoDisplay-Regular", size: UIFont.labelFontSize) else {
            fatalError("""
        Failed to load the "SanFranciscoDisplay" font.
        Make sure the font file is included in the project and the font name is spelled correctly.
        """
            )
        }
        return customFont
    }
}
