//
//  NEOSelectTableViewCell.swift
//  NEOQuestions
//
//  Created by dengrui on 16/11/23.
//  Copyright © 2016年 dengrui. All rights reserved.
//

import UIKit

private struct SelectCellConfig {
    
    static let selectCellID = "selectCellID"

    static let selectCellH: CGFloat = 60.0
    
    static let margin: CGFloat = 20.0
    
    static let titleLabelY: CGFloat = (selectCellH - titleLabelHW) * 0.5
    
    static let titleLabelHW: CGFloat = 30.0
    
    static let contentLabelX: CGFloat = margin * 2 + titleLabelHW
    
    static let contenLabelW: CGFloat = UIScreen.main.bounds.width - margin * 3 - titleLabelHW
    
    static let selectBgColor = UIColor(hex: "#CFFFE3")
}

class NEOSelectTableViewCell: UITableViewCell {

    var titleLabel = UILabel()
    
    var contentLabel = UILabel()
    
    class func cellFor(tableView: UITableView) -> NEOSelectTableViewCell {
    
        var cell = tableView.dequeueReusableCell(withIdentifier: SelectCellConfig.selectCellID) as?  NEOSelectTableViewCell
        
        if cell == nil {
            cell = NEOSelectTableViewCell(style: .default, reuseIdentifier: SelectCellConfig.selectCellID)
        }
        
        let selectBgView = UIView()
        selectBgView.backgroundColor = SelectCellConfig.selectBgColor
        cell?.selectedBackgroundView = selectBgView
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        
        contentLabel.numberOfLines = 0
        contentLabel.textAlignment = .left
        contentView.addSubview(contentLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame = CGRect(x: SelectCellConfig.margin, y: SelectCellConfig.titleLabelY, width: SelectCellConfig.titleLabelHW, height: SelectCellConfig.titleLabelHW)
        
        contentLabel.frame = CGRect(x: SelectCellConfig.contentLabelX, y: 0, width: SelectCellConfig.contenLabelW, height: SelectCellConfig.selectCellH)
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
