//
//  CustomLoadingView.swift
//  App
//
//  Created by Elaine Cecilio Sangali on 31/10/21.
//

import Foundation
import UIKit

class CustomLoadingView  {
    let controller:UIViewController
    
    var activityIndicator: CustomActivityIndicator
    var customVisualEffect: CustomVisualEffectView
    
    init(controller: UIViewController){
        self.controller = controller;
        activityIndicator = CustomActivityIndicator(style: UIActivityIndicatorView.Style.large)
        customVisualEffect = CustomVisualEffectView()
        
        self.controller.view.addSubview(customVisualEffect)
        self.controller.view.addSubview(activityIndicator)
        setupLayout()
    }
    
    func setupLayout() {
        customVisualEffect.topAnchor.constraint(equalTo: self.controller.view.topAnchor).isActive = true
        customVisualEffect.bottomAnchor.constraint(equalTo: self.controller.view.bottomAnchor).isActive = true
        customVisualEffect.leftAnchor.constraint(equalTo: self.controller.view.leftAnchor).isActive = true
        customVisualEffect.rightAnchor.constraint(equalTo: self.controller.view.rightAnchor).isActive = true
        
        activityIndicator.centerXAnchor.constraint(equalTo: customVisualEffect.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: customVisualEffect.centerYAnchor).isActive = true
    }
    
    func startLoading() {
        self.activityIndicator.loading = true
        self.activityIndicator.isHidden = false
        self.customVisualEffect.isHidden = false
    }
    
    func stopLoading() {
        self.activityIndicator.isHidden = true
        self.activityIndicator.stopAnimating()
        self.customVisualEffect.isHidden = true
    }
    
}
