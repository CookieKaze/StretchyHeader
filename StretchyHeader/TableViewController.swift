//
//  TableViewController.swift
//  StretchyHeader
//
//  Created by Erin Luu on 2016-12-06.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setting dynamic row height
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 110
        
        //Hide Navigation Bar
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    // MARK: Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        return cell
    }
    
    // MARK: Hide statusbar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

