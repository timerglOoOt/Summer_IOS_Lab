//
//  ContactCellViewController.swift
//  HW2
//
//  Created by Тимур Хайруллин on 02.07.2023.
//

import UIKit

struct ListTableViewData{
    let title: String
    let image: UIImage
    
}

final class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellLabel?.backgroundColor = .systemGray6
        cellLabel?.layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        cellLabel?.backgroundColor = .systemGray6
        cellLabel?.layer.cornerRadius = 16
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellLabel.text = nil
        cellImageView.image = nil
    }
    
    func setUp(_ data: ListTableViewData) {
        cellImageView.image = data.image
        cellLabel.text = data.title
    }
    
    
}
