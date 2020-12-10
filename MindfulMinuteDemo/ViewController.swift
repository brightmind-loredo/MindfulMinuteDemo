//
//  ViewController.swift
//  MindfulMinuteDemo
//
//  Created by Ben Church on 2018-07-05.
//  Copyright © 2018 Ben Church. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {

    @IBOutlet weak var meditationMinutesLabel: UILabel!

    // Instantiate the HealthKit Store and Mindful Type
    let healthStore = HKHealthStore()
    let mindfulType = HKObjectType.categoryType(forIdentifier: .mindfulSession)

    @IBAction func addMinuteAct(_ sender: Any) {
        // Create a start and end time 1 minute apart
        let startTime = Date()
        let endTime = startTime.addingTimeInterval(1.0 * 60.0)

        self.saveMindfullAnalysis(startTime: startTime, endTime: endTime)
        print("xxx startTime: \(startTime)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.activateHealthKit()
    }

    func activateHealthKit() {
        // Define what HealthKit data we want to ask to write
        let typestoShare = Set([
            HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.mindfulSession)!
            ])

        // If necessary, Prompt the User for HealthKit Write Authorization
        self.healthStore.requestAuthorization(toShare: typestoShare, read: nil) { (success, error) -> Void in
            if !success{
                print("HealthKit Auth error\(String(describing: error))")
            }
            // self.retrieveMindFulMinutes()
        }
    }

    //
    // Save a meditation to HealthKit,  mindful minutes will be calculated from difference between start and end times.
    // In HKCategorySample, value will always be 0 since the Meditation Minutes are calculated by HelthKit
    //
    func saveMindfullAnalysis(startTime: Date, endTime: Date) {
        // Create a mindful session with the given start and end time
        let mindfullSample = HKCategorySample(type:mindfulType!,  value: 0, start: startTime, end: endTime)

        // Save it to the health store
        healthStore.save(mindfullSample, withCompletion: { (success, error) -> Void in
            if error != nil {return}

            print("New data was saved in HealthKit: \(success) start: \(startTime) end: \(endTime)")
            // self.retrieveMindFulMinutes()
        })
    }

}

