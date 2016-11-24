//
//  NEOSilenceHeaderView.swift
//  NEOQuestions
//
//  Created by dengrui on 16/11/23.
//  Copyright © 2016年 dengrui. All rights reserved.
//

import UIKit

private struct SilenceHeaderViewConfig {
    
    static let margin: CGFloat = 20.0
    
    static let titleLabelW = UIScreen.main.bounds.width - margin * 2
}

class NEOSilenceHeaderView: UIView {

    var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        titleLabel.numberOfLines = 0
        
        titleLabel.textAlignment = .left
        
        addSubview(titleLabel)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame = CGRect(x: SilenceHeaderViewConfig.margin, y: 0, width: SilenceHeaderViewConfig.titleLabelW, height: bounds.height)
    }

}
