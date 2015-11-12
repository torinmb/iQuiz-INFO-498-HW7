//
//  MasterViewController.swift
//  iQuiz
//
//  Created by blankens on 10/29/15.
//  Copyright © 2015 Adobe. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController{

    var detailViewController: DetailViewController? = nil
    
    var quizzes : [Quiz] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        let settings = UIBarButtonItem(image: UIImage(named: "Settings"), style: .Plain, target: self, action: "selectedSettings:")
        self.navigationItem.rightBarButtonItem = settings
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        var q1 = Question(question: "5 + 5", answer: "10", answers: ["10", "4", "8", "2", "1"])
        var q2 = Question(question: "5 + 2", answer: "7", answers: ["10", "7", "8", "2", "1"])
        var q3 = Question(question: "5 + 1", answer: "6", answers: ["10", "6", "8", "2", "1"])
        var q4 = Question(question: "5 + 0", answer: "5", answers: ["10", "5", "8", "2", "1"])
        let quiz1 = Quiz(title: "Math", description: "Math & Stuff", questions: [q1, q2, q3, q4])
        let quiz2 = Quiz(title: "Math2", description: "Math & Stuff2", questions: [q2, q1, q4, q3])
        self.quizzes = [quiz1, quiz2]
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func selectedSettings(sender: AnyObject) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let quiz = quizzes[indexPath.row]
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.quiz = quiz
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
                controller.navigationItem.title = quiz.title
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell?
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier) as UITableViewCell
        }
        let quiz = quizzes[indexPath.row]
        cell!.textLabel!.text = quiz.title
        cell!.detailTextLabel!.text = quiz.description
        return cell!
    }
}

