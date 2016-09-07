//
//  SliderView.swift
//  Protect
//
//  Created by Kevin Grozav on 4/4/16.
//  Copyright © 2016 Kevin Grozav. All rights reserved.
//

import UIKit

class SliderView: UITableViewController {
    
    @IBOutlet weak var loginBtn: UIBarButtonItem!
    
    //colors for the cells
    let fireColor = UIColor(red: 0.78, green: 0.15, blue: 0.21, alpha: 1)
    let medicalColor = UIColor(red: 0.1, green: 0.46, blue:0.99, alpha: 1)
    let minorDisturbanceColor = UIColor(red: 0.87, green: 0.46, blue: 0.0, alpha: 1)
    let extremeThreatColor = UIColor.blackColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIScreen.mainScreen().nativeBounds.height == 960.0 {
            print("Executed")
            self.tableView.rowHeight = 50.05
        } 
        //self.automaticallyAdjustsScrollViewInsets = false
       
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    @IBAction func loginBtnClicked(sender: AnyObject) {
        let loginPage = self.storyboard?.instantiateViewControllerWithIdentifier("LoginView")
        self.presentViewController(loginPage!, animated: true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title = "Alarms"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        }
        return "1"
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        if let view = view as? UITableViewHeaderFooterView {
            view.textLabel!.textColor = UIColor.clearColor()
        }
  
    }
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            return makeTopCell(indexPath)
        } else {
            return makeBottomCell(indexPath)
        }

    }
    
    func makeTopCell(indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("topCell")! as! topCell
        
        switch (indexPath.section) {
        case 0:
            cell.backgroundColor = fireColor.colorWithAlphaComponent(0.9)
            cell.cellTitle.text = "Fire or Smoke Alarm"
            cell.cellTitle.textColor = UIColor.whiteColor()
        case 1:
            cell.backgroundColor = medicalColor.colorWithAlphaComponent(0.9)
            cell.cellTitle.text = "Medical Emergency"
            cell.cellTitle.textColor = UIColor.whiteColor()
        case 2:
            cell.backgroundColor = minorDisturbanceColor.colorWithAlphaComponent(0.9)
            cell.cellTitle.text = "Minor Disturbance"
            cell.cellTitle.textColor = UIColor.whiteColor()
        case 3:
            cell.backgroundColor = extremeThreatColor.colorWithAlphaComponent(0.9)
            cell.cellTitle.text = "Extreme Threat"
            cell.cellTitle.textColor = UIColor.whiteColor()
        default:
            cell.backgroundColor = UIColor.clearColor()
            cell.cellTitle.text = "Nil"
            cell.cellTitle.textColor = UIColor.whiteColor()
        }
        return cell
    }
    
    func makeBottomCell(indexPath : NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("bottomCell")!
        switch (indexPath.section) {
        case 0:
            cell.backgroundColor = fireColor
        case 1:
            cell.backgroundColor = medicalColor
        case 2:
            cell.backgroundColor = minorDisturbanceColor
        case 3:
            cell.backgroundColor = extremeThreatColor
        default:
            cell.backgroundColor = UIColor.clearColor()
        }
        return cell
    }

    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        if (indexPath.row == 0) {
            return nil
        }
        
        let alarmAction = UITableViewRowAction(style: .Normal, title: "Launch") { (action : UITableViewRowAction!, indexPath: NSIndexPath!) in
            
            let alarmViewController = self.storyboard?.instantiateViewControllerWithIdentifier("timerView") as! TimerViewController
            
            switch (indexPath.section) {
                
            case 0:
                alarmViewController.type = .FIRE
                alarmViewController.textBGColor = self.fireColor
            case 1:
                alarmViewController.type =  .MEDICAL
                alarmViewController.textBGColor = self.medicalColor
            case 2:
                alarmViewController.type = .MINOR
                alarmViewController.textBGColor = self.minorDisturbanceColor
            case 3:
                alarmViewController.type = .EXTREME
                alarmViewController.textBGColor = self.extremeThreatColor
            default:
                alarmViewController.textBGColor  = UIColor.blackColor()
            }
            
            self.showViewController(alarmViewController, sender: alarmViewController)
        }
        
        return [alarmAction]
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
