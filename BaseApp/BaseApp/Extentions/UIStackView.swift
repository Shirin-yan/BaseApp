//
//  UIStackView.swift
//  BaseApp
//
//  Created by Shirin on 3/24/23.
//

import UIKit.UIStackView

extension UIStackView {

    var bgView: UIView? {
        set { self.bgView = newValue }
        get { return self.bgView }
    }
    convenience init(axis: NSLayoutConstraint.Axis,
                     alignment: Alignment,
                     spacing: CGFloat,
                     edgeInsets: UIEdgeInsets? = nil,
                     distribution: Distribution? = nil,
                     backgroundColor: UIColor? = nil,
                     cornerRadius: CGFloat? = nil) {
        
        self.init(frame: .zero)
        self.axis = axis
        self.alignment = alignment
        self.spacing = spacing
        
        if edgeInsets != nil {
            isLayoutMarginsRelativeArrangement = true
            layoutMargins = edgeInsets!
        }
        
        if distribution != nil {
            self.distribution = distribution!
        }
        
        if backgroundColor != nil || cornerRadius != nil {
            addBackground(color: backgroundColor,
                          cornerRadius: cornerRadius)
        }
    }
    
    func addMargins(insets: UIEdgeInsets) {
        
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = insets
    }
        
    func addBackground(color: UIColor?,
                       cornerRadius: CGFloat?,
                       borderWidth: CGFloat = 0,
                       borderColor: UIColor? = nil) {
        addBackground()
        
        bgView?.backgroundColor = color
        bgView?.layer.cornerRadius = cornerRadius ?? 0
        bgView?.layer.borderWidth = borderWidth
        bgView?.layer.borderColor = borderColor?.cgColor
    }
    
    private func addBackground() {
        if bgView != nil { return }
        bgView = UIView(frame: frame)
        bgView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(bgView!, at: 0)
    }

    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { vw in
            addArrangedSubview(vw)
        }
    }
    
    func removeSubviews() {
        self.subviews.forEach { vw in
            if vw != bgView {
                vw.removeFromSuperview()
            }
        }
    }
}
