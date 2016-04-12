//
//  WorkoutManager.swift
//  WorkoutSelector
//
//  Created by Justin Morrow on 4/10/16.
//  Copyright © 2016 JPMorrow. All rights reserved.
//

import UIKit

class JPWorkoutManager: NSObject, UITableViewDataSource {
    var workout = JPWorkout()
    var exercises = Set<JPExercise>()
    
    // MARK: Class methods
    
    func addExercise(exercise: JPExercise) {
        exercises.insert(exercise)
    }
    
    func generateWorkout() {
        // TODO: Implement
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = workout.exercises[indexPath.row].name
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workout.exercises.count
    }
}

/// Has an optional name and an ordered set of exercises
class JPWorkout {
    var name: String?
    var exercises = NSOrderedSet()
    
    // Class methods
    init() {}
    init(givenExercises: Set<JPExercise>, numExercises: Int) {
        
    }
}

/// Has a name, has a set of target muscle groups, and is hashable.
class JPExercise: Hashable {
    
    var name: String?
    var targetGroups = Set<JPMuscleGroup>()
    
    // MARK: Class Functions
    
    init(name: String) {
        self.name = name
    }
    
    func addTargetMuscleGroup(muscleGroup: JPMuscleGroup) {
        targetGroups.insert(muscleGroup)
    }
    
    func removeTargetMuscleGroup(muscleGroup: JPMuscleGroup) {
        targetGroups.remove(muscleGroup)
    }
    
    // MARK: Hashable
    
    var hashValue: Int {
        var sum: UInt = 0
        for muscleGroup in targetGroups {
            sum += muscleGroup.rawValue
        }
        return Int(sum)
    }
}

// JPExercise: Equatable

func ==(left: JPExercise, right: JPExercise) -> Bool {
    // TODO: Optimization. Return false always
    return ((left.name == right.name) && (left.targetGroups == right.targetGroups))
}

/// Enum with defined values for all target muscle groups. 
/// Each group is assigned a power of 2
enum JPMuscleGroup: UInt, CustomStringConvertible {
    case none = 0
    case neck = 1
    case shoulders = 2
    case triceps = 4
    case biceps = 8
    case forearms = 16
    case back = 32
    case chest = 64
    case waist = 128
    case hips = 256
    case thighs = 512
    case calves = 1024
    
    // MARK: CustomStringConvertible
    
    var description: String {
        switch self {
        case .none: return "None"
        case .neck: return "Neck"
        case .shoulders: return "Shoulders"
        case .triceps: return "Triceps"
        case .biceps: return "Biceps"
        case .forearms: return "Forearms"
        case .back: return "Back"
        case .chest: return "Chest"
        case .waist: return "Waist"
        case .hips: return "Hips"
        case .thighs: return "Thighs"
        case .calves: return "Calves"
        }
    }
}