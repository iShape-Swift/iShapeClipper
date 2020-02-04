//
//  UnionSolver.swift
//  iGeometry
//
//  Created by Nail Sharipov on 05.11.2019.
//

import iGeometry

extension Solver {
    
    static func union(navigator aNavigator: FilterNavigator, master: [IntPoint], slave: [IntPoint]) -> PlainShape {
        var filterNavigator = aNavigator

        var pathList = PlainShape.empty
        
        let masterCount = master.count
        let masterLastIndex = masterCount - 1
        
        let slaveCount = slave.count
        let slaveLastIndex = slaveCount - 1
        
        var cursor = filterNavigator.next()
        
        while cursor.isNotEmpty {

            var path = [IntPoint]()
            
            let start = cursor
            
            repeat {
                // in-out slave path
                
                let outCursor = filterNavigator.navigator.nextSlaveOut(cursor: cursor)
                
                let inSlaveStart = filterNavigator.navigator.slaveStartStone(cursor: cursor)
                let outSlaveEnd = filterNavigator.navigator.slaveEndStone(cursor: outCursor)
                
                let startPoint = filterNavigator.navigator.slaveStartPoint(cursor: cursor)
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
                
                if inSlaveStart >= outSlaveEnd {
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
                
                let endPoint = filterNavigator.navigator.slaveEndPoint(cursor: outCursor)
                path.append(endPoint)
                
                cursor = filterNavigator.navigator.nextMaster(cursor: outCursor)
                filterNavigator.navigator.mark(cursor: cursor)
                
                // out-in master path
                
                let outMasterEnd = filterNavigator.navigator.masterEndStone(cursor: outCursor)
                let inMasterStart = filterNavigator.navigator.masterStartStone(cursor: cursor)
                
                
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
                
                if outMasterEnd >= inMasterStart {
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
            pathList.add(path: path, isClockWise: isClockWise)
            
            cursor = filterNavigator.next()
        }

        return pathList
    }
       
}

fileprivate extension PinNavigator {
    
    mutating func nextSlaveOut(cursor: Cursor) -> Cursor {
        // keep in mind Test 11, 27
        let start = cursor

        var next = self.nextSlave(cursor: cursor)
        
        if start.type == .in_out {
            return next
        }

        while start != next {
            if next.type == .inside {
                break
            }
            
            // only .in_out is possible here
            
            let nextNext = self.nextSlave(cursor: next)

            // try to find next cursor going by master
            var masterCursor = start
            
            repeat {
                masterCursor = self.nextMaster(cursor: masterCursor)
            } while masterCursor != next && masterCursor != nextNext
            
            if masterCursor != next {
                return next
            }
            
            // it's inner cursor, skip it
            self.mark(cursor: next)

            next = nextNext
        }

        return next
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
