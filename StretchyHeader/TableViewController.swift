//
//  TableViewController.swift
//  StretchyHeader
//
//  Created by Erin Luu on 2016-12-06.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

import UIKit
private let kTableHeaderHeight: CGFloat = 300

struct NewsItem {
    var catName: String
    var textColour: UIColor
    var headline: String
}

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    var newsArray = [NewsItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setting dynamic row height
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 110
        
        //Hide Navigation Bar
        self.navigationController?.isNavigationBarHidden = true
        
        //Setup header
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        //tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
        
        //Create Categories
        newsArray.append(NewsItem.init(catName: "World", textColour: UIColor.red, headline: "Climate change protests, divestments meet fossil fuels realities"))
        newsArray.append(NewsItem.init(catName: "America", textColour: UIColor.blue, headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"))
        newsArray.append(NewsItem.init(catName: "Europe", textColour: UIColor.green, headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime"))
        newsArray.append(NewsItem.init(catName: "Middle East", textColour: UIColor.yellow, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible"))
        newsArray.append(NewsItem.init(catName: "Africa", textColour: UIColor.orange, headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"))
        newsArray.append(NewsItem.init(catName: "Asia Pacific", textColour: UIColor.purple, headline: "Despite UN ruling, Japan seeks backing for whale hunting"))
        newsArray.append(NewsItem.init(catName: "World", textColour: UIColor.red, headline: "South Africa in $40 billion deal for Russian nuclear reactors"))
        newsArray.append(NewsItem.init(catName: "Europe", textColour: UIColor.green, headline: "'One million babies' created by EU student exchanges"))
    }
    
    func updateHeaderView(){
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if (tableView.contentOffset.y < -kTableHeaderHeight) {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    
    
    // MARK: Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let newsItem = newsArray[indexPath.row]
        cell.categoryLabel.text = newsItem.catName
        cell.categoryLabel.textColor = newsItem.textColour
        cell.headlineLabel.text = newsItem.headline
        
        return cell
    }
    
    // MARK: Hide statusbar
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

