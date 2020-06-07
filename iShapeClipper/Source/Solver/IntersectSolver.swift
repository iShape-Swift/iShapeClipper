//
//  IntersectSolver.swift
//  iGeometry
//
//  Created by Nail Sharipov on 17.11.2019.
//

import iGeometry

extension Solver {

    static func intersect(navigator aFilterNavigator: FilterNavigator, master: [IntPoint], slave: [IntPoint]) -> PlainShape {
        var filterNavigator = aFilterNavigator
        
        var cursor = filterNavigator.next()
        var pathList = PlainShape.empty

        guard cursor.isNotEmpty && cursor.type == .inside else {
            pathList.add(path: slave, isClockWise: false)
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

                let outCursor = filterNavigator.navigator.nextSlaveOut(cursor: cursor)

                let inSlaveStart = filterNavigator.navigator.slaveEndStone(cursor: cursor)
                let outSlaveEnd = filterNavigator.navigator.slaveStartStone(cursor: outCursor)
                
                let startPoint = filterNavigator.navigator.slaveEndPoint(cursor: cursor)
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

                let endPoint = filterNavigator.navigator.slaveStartPoint(cursor: outCursor)
                path.append(endPoint)

                cursor = filterNavigator.navigator.prevMaster(cursor: outCursor)

                filterNavigator.navigator.mark(cursor: cursor)
                
                // out-in master path
                
                let outMasterEnd = filterNavigator.navigator.masterStartStone(cursor: outCursor)
                let inMasterStart = filterNavigator.navigator.masterEndStone(cursor: cursor)

                let isOutMasterNotOverflow: Bool
                let outMasterIndex: Int
                
                if outMasterEnd.offset != 0 {
                    isOutMasterNotOverflow = true
                    outMasterIndex = outMasterEnd.index
                } else {
                    if outMasterEnd.index != 0 {
                        isOutMasterNotOverflow = true
                        outMasterIndex = outMasterEnd.index - 1
                    } else {
                        isOutMasterNotOverflow = false
                        outMasterIndex = masterCount - 1
                    }
                }
                
                let isInMasterNotOverflow: Bool
                let inMasterIndex: Int
                
                if inMasterStart.index + 1 < masterCount {
                    isInMasterNotOverflow = true
                    inMasterIndex = inMasterStart.index + 1
                } else {
                    isInMasterNotOverflow = false
                    inMasterIndex = 0
                }

                if inMasterStart >= outMasterEnd {
                    if isOutMasterNotOverflow {
                        let sliceB = master[0...outMasterIndex].reversed()
                        path.append(contentsOf: sliceB)
                    }
                    if isInMasterNotOverflow {
                        let sliceA = master[inMasterIndex...masterLastIndex].reversed()
                        path.append(contentsOf: sliceA)
                    }
                } else {
                    if isOutMasterNotOverflow && isInMasterNotOverflow && inMasterIndex <= outMasterIndex {
                        let slice = master[inMasterIndex...outMasterIndex].reversed()
                        path.append(contentsOf: slice)
                    }
                }

            } while cursor != start
            
            path.simplify()
            
            pathList.add(path: path, isClockWise: false)
            
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

            // it's inner cursor skip it
            self.mark(cursor: next)

            next = nextNext
        }

        return next
    }
}
