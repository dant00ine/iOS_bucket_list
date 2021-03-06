//
//  BucketListViewController.swift
//  bucketListV2
//
//  Created by Daniel Thompson on 10/19/16.
//  Copyright © 2016 Daniel Thompson. All rights reserved.
//

import CoreData
import UIKit

class BucketListViewController: UITableViewController, DoneButtonDelegate, CancelButtonDelegate {
    
    var missions = [Mission]()
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath){
        performSegue(withIdentifier: "MissionDetails", sender: tableView.cellForRow(at: indexPath))
    }
    
    @IBAction func addMissionButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "MissionDetails", sender: UIBarButtonItem.self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let controller = navigationController.topViewController as! MissionDetailsViewController
        controller.cancelButtonDelegate = self
        controller.doneButtonDelegate = self
        if ((sender as? UITableViewCell) != nil) {
            let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!)
                controller.editingBool = true
                controller.missionToEditIndexPath = indexPath!.row
                controller.missionToEdit = missions[indexPath!.row]
            
        } else{
            controller.editingBool = false
        }
        

    }
    
    func addMission(controller: MissionDetailsViewController, didFinishAddingMission mission: String){
        dismiss(animated: true, completion: nil)
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        let newMission = NSEntityDescription.insertNewObject(forEntityName: "Mission", into: managedObjectContext) as! Mission
        newMission.details = mission
        if managedObjectContext.hasChanges {
            do{
                try managedObjectContext.save()
                print("success")
            } catch {
                print("\(error)")
            }
        }
        fetchAllMissions()
        tableView.reloadData()
    }
    
    func editMission(controller: MissionDetailsViewController, didFinishEditingMission mission: Mission){
        dismiss(animated: true, completion: nil)
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        print("editMission in Bucket List")
        print("\(mission)")
        if managedObjectContext.hasChanges {
            do{
                try managedObjectContext.save()
                print("edit success")
            } catch {
                print("\(error)")
            }
        }
        fetchAllMissions()
        tableView.reloadData()
    }
    
    func cancelButtonPressedFrom() {
        dismiss(animated: true, completion: nil)
    }
    
    func fetchAllMissions() {
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        let userRequest: NSFetchRequest<Mission> = NSFetchRequest(entityName: "Mission")
        do {
            let results = try managedObjectContext.fetch(userRequest)
            missions = results
        } catch {
            print("\(error)")
        }
        
    }
    
    // SUPPORT SWIPING TO DELETE FROM THE VIEW TABLE
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
            print("Is htis what happened? \(indexPath)")
            let missionToDelete = missions[indexPath[1]]
            managedObjectContext.delete(missionToDelete)
            fetchAllMissions()
            tableView.reloadData()
            
            if managedObjectContext.hasChanges {
                do{
                    try managedObjectContext.save()
                    print("edit success")
                } catch {
                    print("\(error)")
                }
            }
        }
    }

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
        
        cell.textLabel?.text = missions[indexPath.row].details

        // Configure the cell...

        return cell
    }
    
    override func viewDidLoad() {
        
       fetchAllMissions()
        
//        _ = NSEntityDescription.insertNewObject(forEntityName: "Mission", into: managedObjectContext) as! Mission
        
//        let missionRequest: NSFetchRequest<Mission> = NSFetchRequest(entityName: "Mission")
        
        super.viewDidLoad()
    /*
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        
        let mission = NSEntityDescription.insertNewObject(forEntityName: "Mission", into: managedObjectContext) as! Mission
        mission.details = "Sutekina Afternoon"
        
        if managedObjectContext.hasChanges {
            do{
                try managedObjectContext.save()
                print("success")
            } catch {
                print("\(error)")
            }
        }
    */
        
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
