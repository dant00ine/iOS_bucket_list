//
//  MissionDetailsViewControllerDelegate.swift
//  bucketListV2
//
//  Created by Daniel Thompson on 10/19/16.
//  Copyright © 2016 Daniel Thompson. All rights reserved.
//

import UIKit
protocol DoneButtonDelegate: class{
    
    func addMission(controller: MissionDetailsViewController, didFinishAddingMission mission: String)
    
    func editMission(controller: MissionDetailsViewController, didFinishEditingMission mission: Mission)
}
