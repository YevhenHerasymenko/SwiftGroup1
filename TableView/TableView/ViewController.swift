//
//  ViewController.swift
//  TableView
//
//  Created by Wild Deer on 26.07.16.
//  Copyright © 2016 spalah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNib(ContactPreviewCell.nib,
                                  forCellReuseIdentifier: ContactPreviewCell.reuseIdentifier)
            tableView.tableFooterView = UIView()
            }
    }


    var objects: [String] = ["String 0", "String1"] {
        didSet {
            guard oldValue != objects else { return }
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ContactPreviewCell
        cell = tableView.dequeueReusableCellWithIdentifier(ContactPreviewCell.reuseIdentifier,
                                                           forIndexPath: indexPath) as! ContactPreviewCell
        cell.contactNameLabel.text = objects[indexPath.row]
        return cell
    }

    @IBAction func newItemButtonTapped(sender: UIBarButtonItem) {
        var string = ""
        for i in 0..<objects.count {
            string.appendContentsOf("String \(objects.count)")
            if i != objects.count - 1 {
                string.appendContentsOf("\n")
            }
        }
        objects.append(string)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        objects.removeAtIndex(indexPath.row)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let labelInsets = UIEdgeInsets(top: 8, left: 8, bottom: 9, right: 8)
        let widthLimit = tableView.frame.width - labelInsets.left - labelInsets.right
        let size = CGSize(width: widthLimit, height: CGFloat.max)
        let attributes = [NSFontAttributeName: UIFont.systemFontOfSize(17)]
        let text = objects[indexPath.row]
        let rect = text.boundingRectWithSize(size, options: [.UsesFontLeading, .UsesLineFragmentOrigin], attributes: attributes, context: nil)
        return ceil(rect.height) + labelInsets.top + labelInsets.bottom
    }
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        let height = CGFloat(indexPath.row + 2) * 20
//        return height
//    }
}
