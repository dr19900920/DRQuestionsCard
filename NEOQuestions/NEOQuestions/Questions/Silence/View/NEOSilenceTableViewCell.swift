//
//  NEOSilenceTableViewCell.swift
//  NEOQuestions
//
//  Created by dengrui on 16/11/23.
//  Copyright © 2016年 dengrui. All rights reserved.
//

import UIKit

protocol SilenceCellDelegate: NSObjectProtocol {
    
    func contentFieldDidBeginEditing(cell: NEOSilenceTableViewCell, index: Int)
    
    func contentFieldDidEndEditing(cell: NEOSilenceTableViewCell, index: Int)
    
    func contentFieldShouldReturn(cell: NEOSilenceTableViewCell, index: Int)
}

private struct SilenceCellConfig {

    static let silenceCellID = "silenceCell"
    
    static let margin: CGFloat = 20.0
    
    static let silenceCellH: CGFloat = 50.0
    
    static let titleLabelY: CGFloat = (silenceCellH - titleLabelHW) * 0.5
    
    static let titleLabelHW: CGFloat = 30
    
    static let contentFieldX: CGFloat = margin * 2 + titleLabelHW
    
    static let contentFieldY: CGFloat = (silenceCellH - contentFieldH) * 0.5
    
    static let contentFieldW: CGFloat = UIScreen.main.bounds.width - 2 * margin - contentFieldX
    
    static let contentFieldH: CGFloat = 35.0
}

class NEOSilenceTableViewCell: UITableViewCell {

    weak var delegate: SilenceCellDelegate?
    
    var titleLabel = UILabel()
    
    var contentField = UITextField()
    
    class func cellFor(tableView: UITableView) -> NEOSilenceTableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: SilenceCellConfig.silenceCellID) as?  NEOSilenceTableViewCell
        
        if cell == nil {
            cell = NEOSilenceTableViewCell(style: .default, reuseIdentifier: SilenceCellConfig.silenceCellID)
        }
        
        cell?.selectionStyle = .none
        
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
    
        contentField.layer.borderColor = UIColor.gray.cgColor
        contentField.layer.borderWidth = 0.5
        contentField.layer.cornerRadius = 2.5
        contentField.layer.masksToBounds = true
        contentField.delegate = self
        contentView.addSubview(contentField)
        
        titleLabel.textAlignment = .center
        contentView.addSubview(titleLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentField.frame = CGRect(x: SilenceCellConfig.contentFieldX, y: SilenceCellConfig.contentFieldY, width: SilenceCellConfig.contentFieldW, height: SilenceCellConfig.contentFieldH)
        
        titleLabel.frame = CGRect(x: SilenceCellConfig.margin, y: SilenceCellConfig.titleLabelY, width: SilenceCellConfig.titleLabelHW, height: SilenceCellConfig.titleLabelHW)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension NEOSilenceTableViewCell: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if let delegate = self.delegate {
            delegate.contentFieldDidBeginEditing(cell: self, index: self.tag)
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let delegate = self.delegate {
            delegate.contentFieldDidEndEditing(cell: self, index: self.tag)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let delegate = self.delegate {
            delegate.contentFieldShouldReturn(cell: self, index: self.tag)
        }
        return true
    }
}
