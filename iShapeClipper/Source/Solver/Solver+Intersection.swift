//
//  Solver+Intersection.swift
//  iGeometry
//
//  Created by Nail Sharipov on 17.11.2019.
//

import iGeometry

extension Solver {

    static func intersect(cursor aCursor: Cursor, navigator aNavigator: PinNavigator, master: [IntPoint], slave: [IntPoint]) -> PlainPathList {
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
                if outCursor == cursor && cursor == start {
                    pathList.append(path: slave, isClockWise: false)
                    return pathList
                }
                
                let inSlaveStart = navigator.slaveEndStone(cursor: cursor)
                let outSlaveEnd = navigator.slaveStartStone(cursor: outCursor)
                
                let startPoint = navigator.slaveEndPoint(cursor: cursor)
                path.append(startPoint)
                
                let isInSlaveStartNotOverflow: Bool
                let inSlaveStartIndex: Int
                if inSlaveStart.index + 1 < slaveCount {
                    isInSlaveStartNotOverflow = true
                    inSlaveStartIndex = inSlaveStart.index + 1
                } else {
                    isInSlaveStartNotOverflow = false
                    inSlaveStartIndex = 0
                }

                let isOutSlaveEndNotOverflow: Bool
                let outSlaveEndIndex: Int
                
                if outSlaveEnd.offset != 0 {
                    isOutSlaveEndNotOverflow = true
                    outSlaveEndIndex = outSlaveEnd.index
                } else {
                    if outSlaveEnd.index != 0 {
                        isOutSlaveEndNotOverflow = true
                        outSlaveEndIndex = outSlaveEnd.index - 1
                    } else {
                        isOutSlaveEndNotOverflow = false
                        outSlaveEndIndex = slaveCount - 1
                    }
                }
                
                if PathMileStone.moreOrEqual(a: inSlaveStart, b: outSlaveEnd) {
                    // a > b
                    if isInSlaveStartNotOverflow {
                        let sliceA = slave[inSlaveStartIndex...slaveLastIndex]
                        path.append(contentsOf: sliceA)
                    }
                    if isOutSlaveEndNotOverflow {
                        let sliceB = slave[0...outSlaveEndIndex]
                        path.append(contentsOf: sliceB)
                    }
                } else {
                    // a < b
                    if isInSlaveStartNotOverflow && isOutSlaveEndNotOverflow && inSlaveStartIndex <= outSlaveEndIndex {
                        let slice = slave[inSlaveStartIndex...outSlaveEndIndex]
                        path.append(contentsOf: slice)
                    }
                }
                
                if outCursor == start {
                   break
                }

                let endPoint = navigator.slaveStartPoint(cursor: outCursor)
                path.append(endPoint)

                cursor = navigator.prevMasterOut(cursor: outCursor)

                navigator.mark(cursor: cursor)
                
                // out-in master path
                
                let outMasterEnd = navigator.masterStartStone(cursor: outCursor)
                let inMasterStart = navigator.masterEndStone(cursor: cursor)

                let isOutMasterEndNotOverflow: Bool
                let outMasterEndIndex: Int
                
                if outMasterEnd.offset != 0 {
                    isOutMasterEndNotOverflow = true
                    outMasterEndIndex = outMasterEnd.index
                } else {
                    if outMasterEnd.index != 0 {
                        isOutMasterEndNotOverflow = true
                        outMasterEndIndex = outMasterEnd.index - 1
                    } else {
                        // TODO no case
                        isOutMasterEndNotOverflow = false
                        outMasterEndIndex = masterCount - 1
                    }
                }
                
                let isInMasterStartNotOverflow: Bool
                let inMasterStartIndex: Int
                
                if inMasterStart.index + 1 < masterCount {
                    isInMasterStartNotOverflow = true
                    inMasterStartIndex = inMasterStart.index + 1
                } else {
                    isInMasterStartNotOverflow = false
                    inMasterStartIndex = 0
                }

                if PathMileStone.moreOrEqual(a: inMasterStart, b: outMasterEnd) {
                    if isOutMasterEndNotOverflow {
                        let sliceB = master[0...outMasterEndIndex].reversed()
                        path.append(contentsOf: sliceB)
                    }
                    if isInMasterStartNotOverflow {
                        let sliceA = master[inMasterStartIndex...masterLastIndex].reversed()
                        path.append(contentsOf: sliceA)
                    }
                } else {
                    if isOutMasterEndNotOverflow && isInMasterStartNotOverflow && inMasterStartIndex <= outMasterEndIndex {
                        let slice = master[inMasterStartIndex...outMasterEndIndex].reversed()
                        path.append(contentsOf: slice)
                    }
                }

            } while cursor != start
            
            pathList.append(path: path, isClockWise: false)
            
            cursor = navigator.nextSubtract()
        }

        return pathList
    }
}

fileprivate extension PinNavigator {

    mutating func nextSlaveOut(cursor: Cursor, stop: Cursor) -> Cursor {
        let start = cursor

        var next = self.nextSlave(cursor: cursor)
        
        while start != next && next.type == .out_in && next != stop {
            self.mark(cursor: next)
            next = self.nextSlave(cursor: next)
        }

        return next
    }

    
    mutating func prevMasterOut(cursor: Cursor) -> Cursor {
        let start = cursor
        
        var prev = self.prevMaster(cursor: cursor)
        
        while start != prev && prev.type == .out_in {
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

