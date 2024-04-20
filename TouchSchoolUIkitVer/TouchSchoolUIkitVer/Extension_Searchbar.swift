//
//  Extension_Searchbar.swift
//  TouchSchoolUIkitVer
//
//  Created by 황성진 on 12/4/23.
//

import Foundation
import UIKit

extension UISearchBar {
    func setTextFieldColor(_ color: UIColor) {
        for subView in self.subviews {
            for subSubView in subView.subviews {
                let view = subSubView as? UITextInputTraits
                if view != nil {
                    let textField = view as? UITextField
                    textField?.backgroundColor = color
                    break
                }
            }
        }
    }
}
