//
//  UnionSolver.swift
//  iGeometry
//
//  Created by Nail Sharipov on 05.11.2019.
//

import iGeometry

extension Solver {
    
    static func union(cursor aCursor: Cursor, navigator aNavigator: PinNavigator, master: [IntPoint], slave: [IntPoint]) -> PlainPathList {
        var navigator = aNavigator
        var cursor = aCursor
        
        var pathList = PlainPathList()
        
        let masterCount = master.count
        let masterLastIndex = masterCount - 1
        
        let slaveCount = slave.count
        let slaveLastIndex = slaveCount - 1
        
        while cursor.isNotEmpty {
            
            navigator.mark(cursor: cursor)
            
            var path = [IntPoint]()
            let start = cursor
            
            repeat {
                // in-out slave path
                
                let outCursor = navigator.nextSlaveOut(cursor: cursor, stop: start)
                
                let inSlaveStart = navigator.slaveStartStone(cursor: cursor)
                
                let outSlaveEnd = navigator.slaveEndStone(cursor: outCursor)
                
                let startPoint = navigator.slaveStartPoint(cursor: cursor)
                path.append(startPoint)
                
                let isInSlaveNotOverflow: Bool
                let inSlaveIndex: Int
                if inSlaveStart.index + 1 < slaveCount {
                    isInSlaveNotOverflow = true
                    inSlaveIndex = inSlaveStart.index + 1
                } else {
                    isInSlaveNotOverflow = false
                    inSlaveIndex = 0
                }
                
                
                let isOutSlaveNotOverflow: Bool
                let outSlaveIndex: Int
                
                if outSlaveEnd.offset != 0 {
                    isOutSlaveNotOverflow = true
                    outSlaveIndex = outSlaveEnd.index
                } else {
                    if outSlaveEnd.index != 0 {
                        isOutSlaveNotOverflow = true
                        outSlaveIndex = outSlaveEnd.index - 1
                    } else {
                        isOutSlaveNotOverflow = false
                        outSlaveIndex = slaveCount - 1
                    }
                }
                
                if PathMileStone.moreOrEqual(a: inSlaveStart, b: outSlaveEnd) {
                    // a > b
                    if isInSlaveNotOverflow {
                        let sliceA = slave[inSlaveIndex...slaveLastIndex]
                        path.append(contentsOf: sliceA)
                    }
                    
                    if isOutSlaveNotOverflow {
                        let sliceB = slave[0...outSlaveIndex]
                        path.append(contentsOf: sliceB)
                    }
                } else {
                    // a < b
                    if isInSlaveNotOverflow && isOutSlaveNotOverflow && inSlaveIndex <= outSlaveIndex {
                        let slice = slave[inSlaveIndex...outSlaveIndex]
                        path.append(contentsOf: slice)
                    }
                }

                
                let endPoint = navigator.slaveEndPoint(cursor: outCursor)
                path.append(endPoint)
                
                cursor = navigator.nextMaster(cursor: outCursor)
                navigator.mark(cursor: cursor)
                
                // out-in master path
                
                let outMasterEnd = navigator.masterEndStone(cursor: outCursor)
                let inMasterStart = navigator.masterStartStone(cursor: cursor)
                
                
                let isOutMasterNotOverflow: Bool
                let outMasterIndex: Int
                if outMasterEnd.index + 1 < masterCount {
                    outMasterIndex = outMasterEnd.index + 1
                    isOutMasterNotOverflow = true
                } else {
                    outMasterIndex = 0
                    isOutMasterNotOverflow = false
                }
                
                
                let isInMasterNotOverflow: Bool
                let inMasterIndex: Int
                if inMasterStart.offset != 0 {
                    inMasterIndex = inMasterStart.index
                    isInMasterNotOverflow = true
                } else {
                    if inMasterStart.index != 0 {
                        inMasterIndex = inMasterStart.index - 1
                        isInMasterNotOverflow = true
                    } else {
                        inMasterIndex = masterCount - 1
                        isInMasterNotOverflow = false
                    }
                }
                
                
                if PathMileStone.moreOrEqual(a: outMasterEnd, b: inMasterStart) {
                    // a > b
                    if isOutMasterNotOverflow {
                        let sliceA = master[outMasterIndex...masterLastIndex]
                        path.append(contentsOf: sliceA)
                    }
                    if isInMasterNotOverflow {
                        let sliceB = master[0...inMasterIndex]
                        path.append(contentsOf: sliceB)
                    }
                } else {
                    // a < b
                    if isInMasterNotOverflow && isOutMasterNotOverflow && outMasterIndex <= inMasterIndex {
                        let slice = master[outMasterIndex...inMasterIndex]
                        path.append(contentsOf: slice)
                    }
                }
            } while cursor != start
            
            let isClockWise = path.isClockWise
            pathList.append(path: path, isClockWise: isClockWise)
            
            cursor = navigator.nextUnion()
        }

        return pathList
    }
       
}


extension PinNavigator {
    
    mutating func nextUnion() -> Cursor {
        var cursor = self.next()
        
        while cursor.isNotEmpty && cursor.type != PinPoint.PinType.outside && cursor.type != PinPoint.PinType.in_out {
            self.mark(cursor: cursor)
            cursor = self.next()
        }
        
        return cursor
    }
}


fileprivate extension PinNavigator {
    
    mutating func nextSlaveOut(cursor: Cursor, stop: Cursor) -> Cursor {
        let start: Cursor = cursor
        
        var prev = cursor
        var cursor = self.nextSlave(cursor: cursor)
        
        while start != cursor && stop != cursor && cursor.type == PinPoint.PinType.in_out {
            let nextMaster = self.nextMaster(cursor: cursor)
            
            if nextMaster == start {
                return cursor
            }
            
            let nextSlave = self.nextSlave(cursor: cursor)
            
            let isCanSkip = self.isCanSkip(prev: prev, cursor: cursor, nextSlave: nextSlave)
            if !isCanSkip {
                return cursor
            }
            
            self.mark(cursor: cursor)
            prev = cursor
            cursor = nextSlave
        }
        
        
        return cursor
    }
    
    private mutating func isCanSkip(prev: Cursor, cursor: Cursor, nextSlave: Cursor) -> Bool {
        var nextMaster = cursor
        var isFoundMaster = false
        var isFoundStart = false
        repeat {
            nextMaster = self.nextMaster(cursor: nextMaster)
            isFoundMaster = nextMaster == nextSlave
            isFoundStart = nextMaster == prev
        } while !(isFoundMaster || isFoundStart)
        
        
        return isFoundMaster
    }
}

private extension Array where Element == IntPoint {

    var isClockWise: Bool {
        var sum: Int64 = 0
        var p1 = self[self.count - 1]
        for p2 in self {
            let difX = p2.x - p1.x
            let sumY = p2.y + p1.y
            sum += difX * sumY
            p1 = p2
        }
        
        return sum >= 0
    }
}