//
//  BucketListViewController.swift
//  bucketListV2
//
//  Created by Daniel Thompson on 10/19/16.
//  Copyright © 2016 Daniel Thompson. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, DoneButtonDelegate, CancelButtonDelegate {
    
    var missions = ["Sky diving", "Live in Hawaii"]
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath){
        performSegue(withIdentifier: "EditMission", sender: tableView.cellForRow(at: indexPath))
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddNewMission" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! MissionDetailsViewController
            controller.cancelButtonDelegate = self
            controller.doneButtonDelegate = self
        } else if segue.identifier == "EditMission" {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! MissionDetailsViewController
            print("Sender:")
            print("\(sender)")
//            controller.newMissionTextField.text = missions[]
            controller.cancelButtonDelegate = self
            controller.doneButtonDelegate = self
//            controller.newMissionTextField.text = sender.tag
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                controller.missionToEdit = missions[indexPath.row]
                controller.missionToEditIndexPath = indexPath.row
            }
        }
    }
    
    func addMission(controller: MissionDetailsViewController, didFinishAddingMission mission: String){
        dismiss(animated: true, completion: nil)
        missions.append(mission)
        tableView.reloadData()
    }
    
    func editMission(controller: MissionDetailsViewController, didFinishEditingMission mission: String, atIndexPath indexPath: Int){
        dismiss(animated: true, completion: nil)
        print("\(indexPath)")
        missions.remove(at: indexPath)
        missions.append(mission)
        tableView.reloadData()
    }
    
    func cancelButtonPressedFrom() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    // SUPPORT EDITING THE VIEW TABLE
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return missions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "missionsCell", for: indexPath)
        
        cell.textLabel?.text = missions[indexPath.row]

        // Configure the cell...

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
