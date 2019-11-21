//
//  Solver+Intersection.swift
//  iGeometry
//
//  Created by Nail Sharipov on 17.11.2019.
//

import iGeometry

extension Solver {

    static func intersect(navigator aNavigator: PinNavigator, master: [IntPoint], slave: [IntPoint]) -> PlainPathList {
        var subNavigator = SubtractNavigator(navigator: aNavigator)
        
        var cursor = subNavigator.next()
        var pathList = PlainPathList()

        guard cursor.isNotEmpty && cursor.type == .inside else {
            pathList.append(path: slave, isClockWise: false)
            return pathList
        }

        let masterCount = master.count
        let masterLastIndex = masterCount - 1
        
        let slaveCount = slave.count
        let slaveLastIndex = slaveCount - 1
        
        while cursor.isNotEmpty {
            
            var path = [IntPoint]()
            let start = cursor
            
            repeat {
                // in-out slave path

                let outCursor = subNavigator.navigator.nextSlaveOut(cursor: cursor)

                let inSlaveStart = subNavigator.navigator.slaveEndStone(cursor: cursor)
                let outSlaveEnd = subNavigator.navigator.slaveStartStone(cursor: outCursor)
                
                let startPoint = subNavigator.navigator.slaveEndPoint(cursor: cursor)
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

                let endPoint = subNavigator.navigator.slaveStartPoint(cursor: outCursor)
                path.append(endPoint)

                cursor = subNavigator.navigator.prevMaster(cursor: outCursor)

                subNavigator.navigator.mark(cursor: cursor)
                
                // out-in master path
                
                let outMasterEnd = subNavigator.navigator.masterStartStone(cursor: outCursor)
                let inMasterStart = subNavigator.navigator.masterEndStone(cursor: cursor)

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
            
            cursor = subNavigator.next()
        }

        return pathList
    }
}

fileprivate extension PinNavigator {

    mutating func nextSlaveOut(cursor: Cursor) -> Cursor {
        // keep in mind Test 27
        let start = cursor

        var next = self.nextSlave(cursor: cursor)

        while start != next {
            if next.type == .outside {
                break
            }
            
            // only .out_in is possible here
            
            let nextNext = self.nextSlave(cursor: next)

            // try to find next cursor going by master
            var masterCursor = start
            
            repeat {
                masterCursor = self.nextMaster(cursor: masterCursor)
            } while masterCursor != next && masterCursor != nextNext
            
            if masterCursor == next {
                return next
            }

            // it's inner cursor skip them
            self.mark(cursor: next)

            next = nextNext
        }

        return next
    }
}

