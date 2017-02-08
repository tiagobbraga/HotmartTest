//
//  DashboardViewController.swift
//  HotmartTest
//
//  Created by Tiago Braga on 06/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

class DashboardViewController: CCCViewController {
    
    let itemsMessage: [Message] = [
        Message(photo: UIImage(named: "persona")!, name: "Tiago Braga"),
        Message(photo: nil, name: "Valeria Cirqueira"),
        Message(photo: nil, name: "Maria Carol"),
        Message(photo: nil, name: "Flávia de Alcântrara Cirqueira"),
        Message(photo: nil, name: "Ana Paula Pereira"),
    ]
    
    static let ReuseCell: String = "MessageCell"
    
    @IBOutlet weak var containerSalesView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Localizable.string(forKey: "title_dashboard")
        
        self.customColorNavigationBar(Style.Color.orange, extendNavigationBar: true)
        
        let salesVC = AppStoryboard.Sales.instance.instantiateViewController(withIdentifier: "Sales")
        self.configureContainerWithViewController(salesVC, inContainer: self.containerSalesView)
        
        self.configCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning");
    }
    
    // MARK: Public Methods
    
    // MARK: Private Methods
    private func configCollectionView() {
        self.collectionView.register(UIView.loadNib(DashboardViewController.ReuseCell), forCellWithReuseIdentifier: DashboardViewController.ReuseCell)
    }
    
    // MARK: Notifications
    
    // MARK: Actions
}

extension DashboardViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemsMessage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MessageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardViewController.ReuseCell, for: indexPath) as! MessageCollectionViewCell
        
        let message = self.itemsMessage[indexPath.row]
        cell.populateMessage(message)
        
        return cell
    }
    
}
