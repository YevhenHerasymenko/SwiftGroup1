//
//  TrophiesTableViewController.swift
//  TrophyList
//
//  Created by Yevhen Herasymenko on 29/07/2016.
//  Copyright © 2016 Yevhen Herasymenko. All rights reserved.
//

import UIKit
import AlamofireImage

class TrophiesTableViewController: UITableViewController {
    
    var trophies = [Trophy]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let trophyNib = UINib(nibName: CellName.Trophy, bundle:nil)
        tableView.registerNib(trophyNib, forCellReuseIdentifier: CellName.Trophy)
        
        NetworkManager.getTrophies({ [unowned self] trophies in
            self.trophies = trophies
            self.tableView.reloadData()
        })
        tableView.estimatedRowHeight = 110
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshTable), forControlEvents: UIControlEvents.ValueChanged)
        refreshControl = refresh

    }
    
    func refreshTable() {
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trophies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellName.Trophy, forIndexPath: indexPath) as! TrophyTableViewCell
        let trophy = trophies[indexPath.row]
        cell.trophyTitleLabel.text = trophy.title
        cell.trophyDescriptionLabel.text = trophy.description
        let filter = AspectScaledToFitSizeFilter(size: cell.trophyImageView.frame.size)
        let imageUrl = NSURL(string: trophy.image)!
        cell.trophyImageView.af_setImageWithURL(imageUrl, filter: filter)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath)
    }

}
