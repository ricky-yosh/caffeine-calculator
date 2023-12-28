//
//  CoffeeUIProgressView.swift
//  CaffeineCalculator
//
//  Created by Ricky Yoshioka on 11/23/23.
//

import UIKit

class CoffeeUIProgressView: UIProgressView {
    override func layoutSubviews() {
        super.layoutSubviews()

        let maskLayerPath = UIBezierPath(roundedRect: bounds, cornerRadius: 4.0)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskLayerPath.cgPath
        layer.mask = maskLayer
    }
}
