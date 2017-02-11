//
//  MessageViewController.swift
//  HotmartTest
//
//  Created by Tiago Braga on 06/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {
    
    let itemsMessage: [Message] = [
        Message(photo: UIImage(named: "persona")!, name: "Tiago Braga"),
        Message(photo: nil, name: "Valeria Cirqueira"),
        Message(photo: nil, name: "Maria Carol"),
        Message(photo: nil, name: "Flávia de Alcântrara Cirqueira"),
        Message(photo: nil, name: "Ana Paula Pereira"),
        Message(photo: UIImage(named: "persona")!, name: "Tiago Braga"),
        Message(photo: nil, name: "Valeria Cirqueira"),
        Message(photo: nil, name: "Maria Carol"),
        Message(photo: nil, name: "Flávia de Alcântrara Cirqueira"),
        Message(photo: nil, name: "Ana Paula Pereira")
    ]
    
    static let ReuseCell: String = "MessageCell"
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = Localizable.string(forKey: "title_messages")
        
        self.customColorNavigationBar(Style.Color.yellow, extendNavigationBar: true)
        self.configCollectionView()
        self.customRightButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning");
    }
    
    // MARK: Public Methods
    
    // MARK: Private Methods
    private func configCollectionView() {
        self.collectionView.register(UIView.loadNib(MessageViewController.ReuseCell), forCellWithReuseIdentifier: MessageViewController.ReuseCell)
    }
    
    private func customRightButtonItem() {
        let tagView: TagView = UIView.loadView("TagView", index: 0) as! TagView
        let barButtonItem: UIBarButtonItem = UIBarButtonItem(customView: tagView)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    // MARK: Notifications
    
    // MARK: Actions
    
}

extension MessageViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemsMessage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MessageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageViewController.ReuseCell, for: indexPath) as! MessageCollectionViewCell
        
        let message = self.itemsMessage[indexPath.row]
        cell.populateMessage(message)
        
        return cell
    }
    
}
