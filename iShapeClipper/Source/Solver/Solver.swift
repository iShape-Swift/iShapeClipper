//
//  Solver.swift
//  iGeometry
//
//  Created by Nail Sharipov on 02.11.2019.
//

import iGeometry

public struct Solver {
    
    public static func cut(master: [IntPoint], slave: [IntPoint], iGeom: IntGeom) -> CutSolution {
        let navigator = CrossDetector.findPins(iMaster: master, iSlave: slave, iGeom: iGeom, exclusionPinType: PinPoint.PinType.in_out)
        
        guard !navigator.isEqual else {
            return CutSolution(restPathList: .empty, bitePathList: .empty, nature: .empty)
        }

        let filterNavigator = FilterNavigator(navigator: navigator, primary: .inside, secondary: .out_in)
        
        let cursor = filterNavigator.first()
        
        guard cursor.isNotEmpty else {
            if master.isContain(hole: slave, isClockWise: false) {
                return CutSolution(restPathList: .empty, bitePathList: .empty, nature: .hole)
            } else {
                return CutSolution(restPathList: .empty, bitePathList: .empty, nature: .empty)
            }
            
            
        }

        let restPathList = Solver.subtract(navigator: filterNavigator, master: master, slave: slave)
        let bitePathList = Solver.intersect(navigator: filterNavigator, master: master, slave: slave)

        if restPathList.layouts.count > 0 {
            return CutSolution(restPathList: restPathList, bitePathList: bitePathList, nature: .overlap)
        } else {
            return CutSolution(restPathList: restPathList, bitePathList: bitePathList, nature: .notOverlap)
        }
    }
    
    public static func subtract(master: [IntPoint], slave: [IntPoint], iGeom: IntGeom) -> SubtractSolution {
        let navigator = CrossDetector.findPins(iMaster: master, iSlave: slave, iGeom: iGeom, exclusionPinType: PinPoint.PinType.in_out)
    
        guard !navigator.isEqual else {
            return SubtractSolution(pathList: .empty, nature: .empty)
        }
    
        let filterNavigator = FilterNavigator(navigator: navigator, primary: .inside, secondary: .out_in)
        
        let cursor = filterNavigator.first()
    
        guard cursor.isNotEmpty else {
            let isSlaveHole = master.isContain(hole: slave, isClockWise: false)
            if isSlaveHole {
                return SubtractSolution(pathList: .empty, nature: .hole)
            } else {
                let isMasterHole = slave.isContain(hole: master, isClockWise: true)
                if isMasterHole {
                    return SubtractSolution(pathList: .empty, nature: .empty)
                } else {
                    return SubtractSolution(pathList: .empty, nature: .notOverlap)
                }
            }
        }
        
        let pathList = Solver.subtract(navigator: filterNavigator, master: master, slave: slave)
        
        if pathList.layouts.count > 0 {
            return SubtractSolution(pathList: pathList, nature: .overlap)
        } else {
            return SubtractSolution(pathList: pathList, nature: .notOverlap)
        }
    }
    
    public static func intersect(master: [IntPoint], slave: [IntPoint], iGeom: IntGeom) -> SubtractSolution {
        let navigator = CrossDetector.findPins(iMaster: master, iSlave: slave, iGeom: iGeom, exclusionPinType: PinPoint.PinType.in_out)
    
        guard !navigator.isEqual else {
            return SubtractSolution(pathList: .empty, nature: .empty)
        }
    
        let filterNavigator = FilterNavigator(navigator: navigator, primary: .inside, secondary: .out_in)
        
        let cursor = filterNavigator.first()
    
        guard cursor.isNotEmpty else {
            return SubtractSolution(pathList: .empty, nature: .notOverlap)
        }
        
        let pathList = Solver.intersect(navigator: filterNavigator, master: master, slave: slave)
        
        if pathList.layouts.count > 0 {
            return SubtractSolution(pathList: pathList, nature: .overlap)
        } else {
            return SubtractSolution(pathList: pathList, nature: .notOverlap)
        }
    }

    public static func union(master: [IntPoint], slave: [IntPoint], iGeom: IntGeom) -> UnionSolution {
        let navigator = CrossDetector.findPins(iMaster: master, iSlave: slave, iGeom: iGeom, exclusionPinType: PinPoint.PinType.out_in)

        guard !navigator.isEqual else {
            var pathList = PlainShape.empty
            pathList.add(path: master, isClockWise: true)
            return UnionSolution(pathList: pathList, nature: .overlap)
        }
        
        let filterNavigator = FilterNavigator(navigator: navigator, primary: .outside, secondary: .in_out)
        
        let cursor = filterNavigator.first()

        guard cursor.isNotEmpty else {
            var pathList = PlainShape.empty
            if navigator.hasContacts {
                if master.isOverlap(points: slave) {
                    pathList.add(path: master, isClockWise: true)
                    return UnionSolution(pathList: pathList, nature: .masterIncludeSlave)
                } else if slave.isOverlap(points: slave) {
                    pathList.add(path: slave, isClockWise: true)
                    return UnionSolution(pathList: pathList, nature: .slaveIncludeMaster)
                } else {
                    return UnionSolution(pathList: pathList, nature: .notOverlap)
                }
            } else {
                if master.isContain(point: slave.any) {
                    pathList.add(path: master, isClockWise: true)
                    return UnionSolution(pathList: pathList, nature: .masterIncludeSlave)
                } else if slave.isContain(point: master.any) {
                    pathList.add(path: slave, isClockWise: true)
                    return UnionSolution(pathList: pathList, nature: .slaveIncludeMaster)
                } else {
                    return UnionSolution(pathList: pathList, nature: .notOverlap)
                }
            }
        }
        
        let pathList = Solver.union(navigator: filterNavigator, master: master, slave: slave)

        if pathList.layouts.count > 0 {
            return UnionSolution(pathList: pathList, nature: .overlap)
        } else {
            return UnionSolution(pathList: .empty, nature: .notOverlap)
        }
    }
    
}

