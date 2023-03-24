//
//  ScrollView.swift
//  tmchat
//
//  Created by Shirin on 3/11/23.
//

import UIKit
import EasyPeasy

class ScrollView: UIScrollView {

    var contentStack: UIStackView!

    init(spacing: CGFloat, edgeInsets: UIEdgeInsets = .zero, keyboardDismissMode: KeyboardDismissMode = .onDrag){
        super.init(frame: .zero)

        self.keyboardDismissMode = keyboardDismissMode
        contentStack = UIStackView(axis: .vertical,
                                   alignment: .fill,
                                   spacing: spacing,
                                   edgeInsets: edgeInsets)
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(contentStack)
        contentStack.easy.layout([
            Top().to(contentLayoutGuide, .top),
            Bottom().to(contentLayoutGuide, .bottom),
            Leading().to(frameLayoutGuide, .leading),
            Trailing().to(frameLayoutGuide, .trailing),
        ])
    }
}
