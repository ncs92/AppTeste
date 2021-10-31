//
//  CustomActivityIndicator.swift
//  App
//
//  Created by Elaine Cecilio Sangali on 31/10/21.
//

import Foundation
import UIKit

class CustomActivityIndicator: UIActivityIndicatorView {
    private var _loading: Bool = false {
        didSet { changeStatusLoading() }
    }
    
    public var loading: Bool {
        get {
            return self._loading
        }
        set {
            self._loading = newValue
        }
    }
    
    override init(style: UIActivityIndicatorView.Style) {
        super.init(style: style)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.color = UIColor.secondary()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func changeStatusLoading() {
        self.isHidden = !self._loading
        
        if (self._loading) {
            self.startAnimating()
            return
        }
        self.stopAnimating()
    }
    
}
