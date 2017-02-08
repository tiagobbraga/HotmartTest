//
//  MenuViewController.swift
//  HotmartTest
//
//  Created by Tiago Braga on 05/02/17.
//  Copyright © 2017 Tiago Braga. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    let itemsMenu: [Menu] = [
        Menu(icon: UIImage(named: "ico_dashboard")!, name: Localizable.string(forKey: "item_menu_dashboard")),
        Menu(icon: UIImage(named: "ico_minhas_vendas")!, name: Localizable.string(forKey: "item_menu_sales")),
        Menu(icon: UIImage(named: "ico_meus_produtos")!, name: Localizable.string(forKey: "item_menu_products")),
        Menu(icon: UIImage(named: "ico_afiliados")!, name: Localizable.string(forKey: "item_menu_affiliates")),
        Menu(icon: UIImage(named: "ico_mensagem")!, name: Localizable.string(forKey: "item_menu_messages")),
        Menu(icon: UIImage(named: "ico_notificacoes")!, name: Localizable.string(forKey: "item_menu_notifications")),
        Menu(icon: UIImage(named: "ico_minha_conta")!, name: Localizable.string(forKey: "item_menu_account")),
        Menu(icon: UIImage(named: "ico_sobre_o_app")!, name: Localizable.string(forKey: "item_menu_app"))
    ]
    
    static let ReuseCell: String = "ItemMenuCell"
    
    @IBOutlet weak var headerMenuView: HeaderMenuView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTableView()
        self.headerMenuView.populateHeader(UIImage(named: "persona")!, withName: "Tiago Braga", withEmail: "contato@tiagobraga.cc")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning");
    }
    
    // MARK: Public Methods
    
    // MARK: Private Methods
    private func configTableView() {
        self.tableView!.register(UIView.loadNib(MenuViewController.ReuseCell), forCellReuseIdentifier: MenuViewController.ReuseCell)
    }
    
    // MARK: Notifications
    
    // MARK: Actions
    
}

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ItemMenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: MenuViewController.ReuseCell, for: indexPath) as! ItemMenuTableViewCell
        
        let menu: Menu = self.itemsMenu[indexPath.row]
        cell.iconImageView!.image = menu.icon!
        cell.nameMenuLabel!.text = menu.name!
        
        return cell
    }
    
}

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var storyboard: UIStoryboard? = nil
        
        switch indexPath.row {
        case 1:
            storyboard = AppStoryboard.Sales.instance
        case 4:
            storyboard = AppStoryboard.Message.instance
        default:
            storyboard = AppStoryboard.Dashboard.instance
        }
        
        if storyboard != nil {
            let controller = storyboard!.instantiateViewController(withIdentifier: "Main")
            self.slideMenuController()?.changeMainViewController(controller, close: true)
        }
    }
    
}
