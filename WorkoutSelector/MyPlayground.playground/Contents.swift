//
//  WorkoutManager.swift
//  WorkoutSelector
//
//  Created by Justin Morrow on 4/10/16.
//  Copyright © 2016 JPMorrow. All rights reserved.
//

import UIKit

class WorkoutManager {
    var workout = Workout()
    var exercises = Array<Exercise>()
    
    // MARK: Class methods
    
    func addExercise(exercise: Exercise) {
        exercises.append(exercise)
    }
    
    func removeExercise(exercise: Exercise) {
        // TODO: Does nothing
    }
    
    func generateWorkout(n: Int) {
        
        var set = Set<Exercise>()
        
        while(set.count < n) {
            let i = Int(arc4random_uniform(UInt32(exercises.count)))
            set.insert(exercises[i])
        }
        
        for exercise in set {
            workout.exercises.append(exercise)
        }
    }
}

/// Has an optional name and an array of exercises
struct Workout {
    var name = String()
    var exercises = Array<Exercise>()
    
    // MARK: Class methods
    
    init() {}
    init(givenExercises: Set<Exercise>, numExercises: Int) {
        
    }
}

/// Has a name, has a set of target muscle groups, and is hashable.
struct Exercise: Hashable {
    
    var name = String()
    var targetGroups = Set<MuscleGroup>()
    
    // MARK: Class methods
    
    init(name: String, targetGroups: Set<MuscleGroup>) {
        self.name = name
        self.targetGroups = targetGroups
    }
    
    mutating func addTargetMuscleGroup(muscleGroup: MuscleGroup) {
        targetGroups.insert(muscleGroup)
    }
    
    mutating func removeTargetMuscleGroup(muscleGroup: MuscleGroup) {
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

// MARK: Exercise: Equatable

func ==(left: Exercise, right: Exercise) -> Bool {
    // TODO: Optimization. Return false always
    return ((left.name == right.name) && (left.targetGroups == right.targetGroups))
}

/// Enum with defined values for all target muscle groups.
/// Each group is assigned a power of 2
enum MuscleGroup: UInt, CustomStringConvertible {
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

let manager = WorkoutManager()
manager.addExercise(Exercise(name: "Pushup", targetGroups: [.triceps, .chest]))
manager.addExercise(Exercise(name: "Pullup", targetGroups: [.back, .biceps, .shoulders]))
manager.addExercise(Exercise(name: "Situp", targetGroups: [.waist]))

manager.exercises

manager.exercises.description

manager.generateWorkout(2)
manager.workout.exercises.description

