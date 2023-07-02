//
//  ContactTableViewController.swift
//  HW2
//
//  Created by Тимур Хайруллин on 02.07.2023.
//

import UIKit


final class ContactTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var contactTableView: UITableView!
    
    var data: [ListTableViewData] = [
        ListTableViewData(title: "89081234567", name: "Timur", image: UIImage(imageLiteralResourceName: "contact")),
        ListTableViewData(title: "89082345678", name: "Artur", image: UIImage(imageLiteralResourceName: "contact")),
        ListTableViewData(title: "89083456789", name: "Zhora", image: UIImage(imageLiteralResourceName: "contact")),
        ListTableViewData(title: "89084567890", name: "Vlad", image: UIImage(imageLiteralResourceName: "contact")),
        ListTableViewData(title: "89085678901", name: "Igor", image: UIImage(imageLiteralResourceName: "contact")),
        ListTableViewData(title: "89086789012", name: "Stepa", image: UIImage(imageLiteralResourceName: "contact"))
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactTableView.dataSource = self
        contactTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contactTableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as? ContactTableViewCell else { return UITableViewCell()}
        
        cell.setUp(data[indexPath.row])
        
        return cell
    }
}
