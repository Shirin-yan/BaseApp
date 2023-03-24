//
//  BaseView.swift
//  BaseApp
//
//  Created by Shirin on 3/24/23.
//

import UIKit
import EasyPeasy

class BaseView: UIView {

    var loading = LoadingView()
    
    var noConnection = NoSmthView(type: .connection)
    
    var noContent = NoSmthView(type: .content)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBaseView()
        
        hideLoading()
        hideNoConnection()
        hideNoContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBaseView(){
        addSubview(loading)
        loading.easy.layout([
            Top(50).to(safeAreaLayoutGuide, .top), Leading(), Trailing(), Bottom()
        ])
        
        addSubview(noContent)
        noContent.easy.layout([
            Top(50).to(safeAreaLayoutGuide, .top), Leading(), Trailing(), Bottom()
        ])

        addSubview(noConnection)
        noConnection.easy.layout([
            Top(50).to(safeAreaLayoutGuide, .top), Leading(), Trailing(), Bottom()
        ])
    }
    
    func loading(_ toShow: Bool){
        if toShow {
            showLoading()
        } else {
            hideLoading()
        }
    }

    func noConnection(_ toShow: Bool){
        if toShow {
            showNoConnection()
        } else {
            hideNoConnection()
        }
    }
    
    func noContent(_ toShow: Bool){
        if toShow {
            showNoContent()
        } else {
            hideNoContent()
        }
    }

    func showLoading(){
        self.bringSubviewToFront(loading)
        loading.loading.startAnimating()
    }

    func hideLoading(){
        self.sendSubviewToBack(loading)
        loading.loading.stopAnimating()
    }

    func showNoConnection(){
        self.bringSubviewToFront(noConnection)
        noConnection.isHidden = false
    }

    func hideNoConnection(){
        self.sendSubviewToBack(noConnection)
        noConnection.isHidden = true
    }

    func showNoContent(){
        self.bringSubviewToFront(noContent)
        noContent.isHidden = false
    }

    func hideNoContent(){
        self.sendSubviewToBack(noContent)
        noContent.isHidden = true
    }    
}
