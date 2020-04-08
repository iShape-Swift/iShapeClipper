//
//  Solver.swift
//  iGeometry
//
//  Created by Nail Sharipov on 02.11.2019.
//

import iGeometry

public struct Solver {
    
    public static func cut(master: [IntPoint], slave: [IntPoint]) -> ComplexSolution {
        let navigator = CrossDetector.findPins(iMaster: master, iSlave: slave, exclusionPinType: PinPoint.PinType.in_out)
        let filterNavigator = FilterNavigator(navigator: navigator, primary: .inside, secondary: .out_in)
        let nature = filterNavigator.nature(master: master, slave: slave, isSlaveClockWise: false)
        
        switch nature {
        case .notOverlap, .equal, .masterIncludeSlave, .slaveIncludeMaster:
            return ComplexSolution(restPathList: .empty, bitePathList: .empty, nature: nature)
        case .overlap:
            let restPathList = Solver.subtract(navigator: filterNavigator, master: master, slave: slave)
            let bitePathList = Solver.intersect(navigator: filterNavigator, master: master, slave: slave)

            return ComplexSolution(restPathList: restPathList, bitePathList: bitePathList, nature: .overlap)
        }
    }

    public static func intersect(master: [IntPoint], slave: [IntPoint]) -> Solution {
        let navigator = CrossDetector.findPins(iMaster: master, iSlave: slave, exclusionPinType: PinPoint.PinType.in_out)
        let filterNavigator = FilterNavigator(navigator: navigator, primary: .inside, secondary: .out_in)
        let nature = filterNavigator.nature(master: master, slave: slave, isSlaveClockWise: false)
        
        switch nature {
        case .notOverlap, .masterIncludeSlave, .slaveIncludeMaster, .equal:
            return Solution(pathList: PlainShape.empty, nature: nature)
        case .overlap:
            let pathList = Solver.intersect(navigator: filterNavigator, master: master, slave: slave)
            return Solution(pathList: pathList, nature: .overlap)
        }
    }
    
    public static func subtract(master: [IntPoint], slave: [IntPoint]) -> Solution {
        let navigator = CrossDetector.findPins(iMaster: master, iSlave: slave, exclusionPinType: PinPoint.PinType.in_out)
        let filterNavigator = FilterNavigator(navigator: navigator, primary: .inside, secondary: .out_in)
        let nature = filterNavigator.nature(master: master, slave: slave, isSlaveClockWise: false)
        
        switch nature {
        case .notOverlap, .equal, .masterIncludeSlave, .slaveIncludeMaster:
            return Solution(pathList: PlainShape.empty, nature: nature)
        case .overlap:
            let pathList = Solver.subtract(navigator: filterNavigator, master: master, slave: slave)
            return Solution(pathList: pathList, nature: .overlap)
        }
    }

    public static func union(master: [IntPoint], slave: [IntPoint]) -> Solution {
        let navigator = CrossDetector.findPins(iMaster: master, iSlave: slave, exclusionPinType: PinPoint.PinType.out_in)
        let filterNavigator = FilterNavigator(navigator: navigator, primary: .outside, secondary: .in_out)
        let nature = filterNavigator.nature(master: master, slave: slave, isSlaveClockWise: true)
        
        switch nature {
        case .notOverlap, .equal, .masterIncludeSlave, .slaveIncludeMaster:
            return Solution(pathList: PlainShape.empty, nature: nature)
        case .overlap:
            let cursor = filterNavigator.first()

            if cursor.type == .in_out {
                if master.isContain(path: slave) {
                    return Solution(pathList: PlainShape.empty, nature: .masterIncludeSlave)
                }
                if slave.isContain(path: master) {
                    return Solution(pathList: PlainShape.empty, nature: .slaveIncludeMaster)
                }
            }

            let pathList = Solver.union(navigator: filterNavigator, master: master, slave: slave)
            return Solution(pathList: pathList, nature: .overlap)
        }
    }
    
}

