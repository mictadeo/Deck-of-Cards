//
//  ViewController.swift
//  Deck of Cards
//
//  Created by Michael Tadeo on 11/8/19.
//  Copyright © 2019 Tadeo Man. All rights reserved.
//

import UIKit

class InitialViewController: UITableViewController {
    
    
    let cards = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "Jack", "Queen", "King"]
    let suits = ["Clubs", "Hearts", "Spades", "Diamonds"]
    var card = String()
    var suit = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Deck of Cards"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = suits[section]
        label.backgroundColor = UIColor.lightGray
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return suits.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cards", for: indexPath)
        suit = suits[indexPath.section]
        card = cards[indexPath.row]
        cell.textLabel?.text = card + " of " + suit
        cell.imageView?.load(url: URL(string: "https://deckofcardsapi.com/static/img/\(card.first!)\(suit.first!).png")!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        suit = suits[indexPath.section]
        card = cards[indexPath.row]
        let vc = storyboard?.instantiateViewController(identifier: "PreviewViewController") as? PreviewViewController
        vc?.urlString = "https://deckofcardsapi.com/static/img/\(card.first!)\(suit.first!).png"
        navigationController?.pushViewController(vc!, animated: true)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
