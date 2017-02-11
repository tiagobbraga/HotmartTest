//
//  DashboardViewController.swift
//  HotmartTest
//
//  Created by Tiago Braga on 06/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController {
    
    let itemsMessage: [Message] = [
        Message(photo: UIImage(named: "persona")!, name: "Tiago Braga"),
        Message(photo: nil, name: "Valeria Cirqueira"),
        Message(photo: nil, name: "Maria Carol"),
        Message(photo: nil, name: "Flávia de Alcântrara Cirqueira"),
        Message(photo: nil, name: "Ana Paula Pereira"),
    ]
    let itemsSale: [Sale] = [
        Sale(description: "Como decorar uma festa infantil maravilhosa...", id: "id 30294080", date: "11/01/2016", price: "R$ 1.035,00"),
        Sale(description: "Como decorar uma festa infantil maravilhosa...", id: "id 30294081", date: "12/01/2016", price: "R$ 1.045,00"),
        Sale(description: "Como decorar uma festa infantil maravilhosa...", id: "id 30294082", date: "13/01/2016", price: "R$ 1.055,00"),
        Sale(description: "Como decorar uma festa infantil maravilhosa...", id: "id 30294083", date: "14/01/2016", price: "R$ 1.015,00"),
        Sale(description: "Como decorar uma festa infantil maravilhosa...", id: "id 30294084", date: "15/01/2016", price: "R$ 1.000,00"),
        Sale(description: "Como decorar uma festa infantil maravilhosa...", id: "id 30294085", date: "16/01/2016", price: "R$ 1.001,00"),
        Sale(description: "Como decorar uma festa infantil maravilhosa...", id: "id 30294086", date: "17/01/2016", price: "R$ 1.002,00")
    ]
    
    static let MessageCell: String = "MessageCell"
    static let SaleCell: String = "SaleCell"

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Localizable.string(forKey: "title_dashboard")
        
        self.customColorNavigationBar(Style.Color.orange, extendNavigationBar: true)
        
        self.configCollectionView()
        self.configTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning");
    }
    
    // MARK: Public Methods
    
    // MARK: Private Methods
    private func configCollectionView() {
        self.collectionView.register(UIView.loadNib(DashboardViewController.MessageCell), forCellWithReuseIdentifier: DashboardViewController.MessageCell)
    }
    
    private func configTableView() {
        self.tableView!.register(UIView.loadNib(SalesViewController.ReuseCell), forCellReuseIdentifier: SalesViewController.ReuseCell)
    }
    
    // MARK: Notifications
    
    // MARK: Actions
}

extension DashboardViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemsMessage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MessageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardViewController.MessageCell, for: indexPath) as! MessageCollectionViewCell
        
        let message = self.itemsMessage[indexPath.row]
        cell.populateMessage(message)
        
        return cell
    }
    
}

extension DashboardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsSale.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SaleTableViewCell = tableView.dequeueReusableCell(withIdentifier: DashboardViewController.SaleCell, for: indexPath) as! SaleTableViewCell
        
        let warning = indexPath.row == 0 || indexPath.row == 1
        let sale = self.itemsSale[indexPath.row]
        // MenuViewController linha 63 também poderia ter feito um método público para popular a célula
        cell.populateSale(sale, withWarning: warning)
        
        cell.backgroundColor = (indexPath.row % 2 == 0) ? Style.Color.almost_white : Style.Color.white
        
        return cell
    }
    
}
