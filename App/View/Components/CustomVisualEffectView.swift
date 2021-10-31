//
//  CustomVisualEffectView.swift
//  App
//
//  Created by Elaine Cecilio Sangali on 31/10/21.
//

import Foundation
import UIKit

class CustomVisualEffectView: UIVisualEffectView {
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
    
    override init(effect: UIVisualEffect?) {
        super.init(effect: effect)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let blurEffect = UIBlurEffect(style: .light)
        self.effect = blurEffect
        self.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func changeStatusLoading() {
        self.isHidden = !self._loading
    }
    
}

