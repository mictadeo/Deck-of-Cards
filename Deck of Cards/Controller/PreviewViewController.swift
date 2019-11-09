//
//  PreviewViewController.swift
//  Deck of Cards
//
//  Created by Michael Tadeo on 11/8/19.
//  Copyright © 2019 Tadeo Man. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    
    var urlString = String()
    
    override func viewDidLoad() {
           super.viewDidLoad()
        img.load(url: URL(string: urlString)!)
       }
}

