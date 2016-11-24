//
//  NEOCrosswordOptionView.swift
//  NEOQuestions
//
//  Created by dengrui on 16/11/24.
//  Copyright © 2016年 dengrui. All rights reserved.
//

import UIKit

private struct CrosswordOptionConfig {
    
    static let margin: CGFloat = 12.5
    
    static let titleLabelW: CGFloat = UIScreen.main.bounds.width - 2 * margin
    
    static let titleLabelH: CGFloat = 180.0
    
    static let itemFontSize: CGFloat = 14
    
    static let itemMinW: CGFloat = 60
    
    static let itemH: CGFloat = 40
    
    static let itemViewY: CGFloat = titleLabelH + margin
}

class NEOCrosswordOptionView: UIView {
    
    open var maxCount: Int = 0
    
    open var titleStr: String! {
    
        didSet {
            setupUI()
        }
    }
    
    open var arraySelectTitles = NSMutableArray()
    
    open var arrayTitles = Array<String>() {
    
        didSet {
            creatItems()
        }
    
    }
    
    fileprivate var array: Array<String>?

    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
}

extension NEOCrosswordOptionView {

    fileprivate func setupUI() {
        
        titleLabel.text = titleStr
        titleLabel.frame = CGRect(x: CrosswordOptionConfig.margin, y: 0, width: CrosswordOptionConfig.titleLabelW, height: CrosswordOptionConfig.titleLabelH)
        addSubview(titleLabel)
        
    }
    
    
    fileprivate func creatItems() {

        let array = arrayTitles.sorted(by: {
            return $0.characters.count < $1.characters.count
        })
        
        var sumItemX: CGFloat = CrosswordOptionConfig.margin
        var sumItemY: CGFloat = CrosswordOptionConfig.itemViewY
        for i in 0..<array.count {
            
            let title = array[i]
            let item = UIButton()
            item.setTitle(title, for: .normal)
            item.sizeToFit()
            item.setTitleColor(UIColor.black, for: .normal)
            item.setTitleColor(UIColor.red, for: .selected)
            item.layer.borderColor = UIColor.lightGray.cgColor
            item.layer.borderWidth = 1.5
            item.layer.cornerRadius = 8
            item.layer.masksToBounds = true
            item.titleLabel?.font = UIFont.systemFont(ofSize: CrosswordOptionConfig.itemFontSize)
            let itemW = (item.frame.width + CrosswordOptionConfig.margin) > CrosswordOptionConfig.itemMinW ? (item.frame.width + CrosswordOptionConfig.margin) : CrosswordOptionConfig.itemMinW
            item.frame.size = CGSize(width: itemW, height: CrosswordOptionConfig.itemH)
            
            if sumItemX + item.frame.width > UIScreen.main.bounds.width - CrosswordOptionConfig.margin * 2 {
                sumItemX = CrosswordOptionConfig.margin
                sumItemY += CrosswordOptionConfig.itemH + CrosswordOptionConfig.margin
            }
            
            item.frame = CGRect(x: sumItemX, y: sumItemY, width: item.frame.width, height: item.frame.height)
            
            sumItemX += item.frame.width + CrosswordOptionConfig.margin
            
            
            item.tag = i
            item.addTarget(self, action: #selector(itemDidClick(on:)), for: .touchUpInside)
            addSubview(item)
            
        }

    }
    
    @objc private func itemDidClick(on sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            if arraySelectTitles.count >= maxCount {
                sender.isSelected = !sender.isSelected
                return
            }
            sender.layer.borderColor = UIColor.red.cgColor
            arraySelectTitles.add(sender.titleLabel!.text!)
        } else {
            sender.layer.borderColor = UIColor.lightGray.cgColor
            arraySelectTitles.remove(sender.titleLabel!.text!)
        }
    }
}
