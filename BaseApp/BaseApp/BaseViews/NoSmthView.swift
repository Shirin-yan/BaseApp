//
//  NoSmthView.swift
//  BaseApp
//
//  Created by Shirin on 3/24/23.
//

import UIKit
import EasyPeasy

enum NoSmthType {
    case connection
    case content
}


class NoSmthView: UIView {

    let contentStack = UIStackView(axis: .vertical,
                                   alignment: .center,
                                   spacing: 22)

    let image = UIImageView()

    let title = UILabel(font: .regular(size: 16),
                        color: .black,
                        alignment: .center,
                        numOfLines: 0)

    let btn = BaseBtn()

    
    init(type: NoSmthType) {
        super.init(frame: .zero)
        
        setupView()
        setupConstraints()
        setupData(type: type)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(type: NoSmthType){
        
        switch type {
        case .connection:
            image.image = UIImage(named: "no-connection")
            title.text = "no_connection".localized()
            
        case .content:
            image.image = UIImage(named: "no-content")
            title.text = "no_content".localized()
        }
    }
    
    func setupView(){
        backgroundColor = .white
        
        addSubview(contentStack)
        contentStack.easy.layout([
            CenterY(-50).with(.high), CenterX()
        ])

        contentStack.addArrangedSubviews([image,
                                          title,
                                          btn])
        
        contentStack.setCustomSpacing(40, after: image)
        contentStack.setCustomSpacing(12, after: title)
        setupConstraints()
    }

    func setupConstraints() {
        image.easy.layout([
            Size(100)
        ])

        title.easy.layout([
            Leading(), Trailing()
        ])
        
        btn.easy.layout(Width(>=(DeviceDimensions.width*0.5)))
    }
}
