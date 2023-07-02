//
//  ContactCellViewController.swift
//  HW2
//
//  Created by Тимур Хайруллин on 02.07.2023.
//

import UIKit

struct ListTableViewData{
    let title: String
    let name: String
    let image: UIImage
    
}

final class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabelNumber: UILabel!
    @IBOutlet weak var cellLabelName: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellLabelNumber?.backgroundColor = .systemGray6
        cellLabelNumber?.layer.cornerRadius = 16
        
        cellLabelName?.backgroundColor = .systemGray6
        cellLabelName?.layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        cellLabelNumber?.backgroundColor = .systemGray6
        cellLabelNumber?.layer.cornerRadius = 16
        
        cellLabelName?.backgroundColor = .systemGray6
        cellLabelName?.layer.cornerRadius = 16
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellLabelNumber.text = nil
        cellLabelName.text = nil
        cellImageView.image = nil
    }
    
    func setUp(_ data: ListTableViewData) {
        cellImageView.image = data.image
        cellLabelNumber.text = data.title
        cellLabelName.text = data.name
    }
    
    
}
