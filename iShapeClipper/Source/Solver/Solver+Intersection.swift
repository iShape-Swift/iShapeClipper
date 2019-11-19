//
//  Solver+Intersection.swift
//  iGeometry
//
//  Created by Nail Sharipov on 17.11.2019.
//

import iGeometry

extension Solver {

    static func intersect(cursor aCursor: Cursor, navigator aNavigator: PinNavigator,  master: [IntPoint], slave: [IntPoint]) -> PlainPathList {
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
                
                let outCursor = navigator.nextSlaveOut(cursor: cursor)
                
                let inSlaveStart = navigator.slaveStartStone(cursor: cursor)
                
                let outSlaveEnd: PathMileStone
                
                let isOutInStart = outCursor == start && path.count > 0
                
                if !isOutInStart {
                    outSlaveEnd = navigator.slaveEndStone(cursor: outCursor)
                } else {
                    // possible if we start with out-in
                    outSlaveEnd = navigator.slaveStartStone(cursor: outCursor)
                }
                
                let startPoint = navigator.slaveStartPoint(cursor: cursor)
                path.append(startPoint)
                
                
                if PathMileStone.moreOrEqual(a: inSlaveStart, b: outSlaveEnd) {
                    // a > b
                    let sliceA = slave[inSlaveIndex...slaveLastIndex]
                    path.append(contentsOf: sliceA)
                    
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
                
                if isOutInStart {
                    // possible if we start with out-in
                    break
                }
                
                let endPoint = navigator.slaveEndPoint(cursor: outCursor)
                path.append(endPoint)

                cursor = navigator.prevMasterOut(cursor: outCursor)
                if cursor == outCursor {
                    break
                }
                
                navigator.mark(cursor: cursor)
                
                // out-in master path
                
                let outMasterEnd = navigator.masterEndStone(cursor: outCursor)
                let inMasterStart = navigator.masterStartStone(cursor: cursor)
                
                let outMasterEndIndex = outMasterEnd.index
                let inMasterStartIndex = inMasterStart.index
                
                if PathMileStone.moreOrEqual(a: inMasterStart, b: outMasterEnd) {
                    let sliceA = master[inMasterStartIndex...masterLastIndex].reversed()
                    path.append(contentsOf: sliceA)
                    let sliceB = master[0...outMasterEndIndex].reversed()
                    path.append(contentsOf: sliceB)
                } else {
                    if outMasterEndIndex > inMasterStartIndex {
                        let slice = master[inMasterStartIndex...outMasterEndIndex].reversed()
                        path.append(contentsOf: slice)
                    }
                }
                
                /*
                
                let isOutMasterNotOverflow: Bool
                let outMasterIndex: Int
                if outMasterStart.index + 1 < masterCount {
                    outMasterIndex = outMasterStart.index + 1
                    isOutMasterNotOverflow = true
                } else {
                    outMasterIndex = 0
                    isOutMasterNotOverflow = false
                }
                
                
                let isInMasterNotOverflow: Bool
                let inMasterIndex: Int
                if inMasterEnd.offset != 0 {
                    inMasterIndex = inMasterEnd.index
                    isInMasterNotOverflow = true
                } else {
                    if inMasterEnd.index != 0 {
                        inMasterIndex = inMasterEnd.index - 1
                        isInMasterNotOverflow = true
                    } else {
                        inMasterIndex = masterCount - 1
                        isInMasterNotOverflow = false
                    }
                }
                
                
                if PathMileStone.moreOrEqual(a: inMasterEnd, b: outMasterStart) {
                    // a > b
                    if isOutMasterNotOverflow {
                        let sliceA = master[outMasterIndex...masterLastIndex].reversed()
                        path.append(contentsOf: sliceA)
                    }
                    if isInMasterNotOverflow {
                        let sliceB = master[0...inMasterIndex].reversed()
                        path.append(contentsOf: sliceB)
                    }
                } else {
                    // a < b
                    if isInMasterNotOverflow && isOutMasterNotOverflow && outMasterIndex <= inMasterIndex {
                        let slice = master[outMasterIndex...inMasterIndex].reversed()
                        path.append(contentsOf: slice)
                    }
                }
 */
            } while cursor != start
            
            pathList.append(path: path, isClockWise: false)
            
            cursor = navigator.nextSubtract()
        }

        return pathList
    }
}

fileprivate extension PinNavigator {
    
    mutating func nextSlaveOut(cursor: Cursor) -> Cursor {
        let start = cursor

        var next = self.nextSlave(cursor: cursor)
        
        while start != next && cursor.type == .out_in {
            self.mark(cursor: next)
            next = self.nextSlave(cursor: next)
        }

        return cursor
    }

    
    mutating func prevMasterOut(cursor: Cursor) -> Cursor {
        let start = cursor
        
        var prev = self.prevMaster(cursor: cursor)
        
        while start != prev && cursor.type == .out_in {
            self.mark(cursor: prev)
            prev = self.prevMaster(cursor: prev)
        }

        return prev
    }
    
    private mutating func isCanSkip(prev: Cursor, cursor: Cursor, nextSlave: Cursor) -> Bool {
        var nextMaster = cursor
        var isFoundMaster: Bool
        var isFoundStart: Bool
        repeat {
            nextMaster = self.nextMaster(cursor: nextMaster)
            isFoundMaster = nextMaster == nextSlave
            isFoundStart = nextMaster == prev
        } while !(isFoundMaster || isFoundStart)
        
        
        return isFoundMaster
    }
}
