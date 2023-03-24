//
//  BaseBtn.swift
//  BaseApp
//
//  Created by Shirin on 3/24/23.
//

import UIKit

class BaseBtn: UIButton {
    
    var clickCallback: ( () -> Void )?

    override init(frame: CGRect) {
        super.init(frame: .zero)
        addTarget(self, action: #selector(click), for: .touchUpInside)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func click() {
        clickCallback?()
    }
}
