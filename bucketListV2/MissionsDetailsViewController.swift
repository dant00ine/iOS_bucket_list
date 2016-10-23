//
//  MissionsDetailsViewController.swift
//  bucketListV2
//
//  Created by Daniel Thompson on 10/19/16.
//  Copyright © 2016 Daniel Thompson. All rights reserved.
//

import CoreData
import UIKit

class MissionDetailsViewController: UITableViewController {
    
    weak var doneButtonDelegate: DoneButtonDelegate?
    weak var cancelButtonDelegate: CancelButtonDelegate?
    @IBOutlet weak var newMissionTextField: UITextField!
    var missionToEdit: Mission?
    var missionToEditIndexPath: Int?
    var editingBool: Bool?
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext

    
    @IBAction func cancelBarButtonPressed(_ sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom()
    }
    @IBAction func doneBarButtonPressed(_ sender: UIBarButtonItem) {
        if editingBool! == true {
            print("Edit section")
            doneButtonDelegate?.editMission(controller: self, didFinishEditingMission: missionToEdit!)
        } else {
            print("Add section")
            let mission = newMissionTextField.text!
            doneButtonDelegate?.addMission(controller: self, didFinishAddingMission: mission)
        }
        
//        doneButtonDelegate?.addMission(controller: self, didFinishAddingMission: newMissionTextField.text!)
    }
    
    // Override to support editing the table view.
    /*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
 */

    override func viewDidLoad() {
        super.viewDidLoad()
        newMissionTextField.text = missionToEdit?.details
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
