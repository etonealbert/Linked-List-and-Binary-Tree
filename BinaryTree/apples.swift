class Solution {
    func minTime(_ n: Int,_ edges: [[Int]],_ hasApple: [Bool]) -> Int {
        let graph = edges.reduce(into: [Int:[Int]]()){ graph, edge in 
            graph[edge[0], default: .init()].append(edge[1])
            graph[edge[1], default: .init()].append(edge[0])
        }

        var visited = Set([0])

        func visit(_ edge: Int) -> Int {
            let seconds = graph[edge]!.reduce(0) { 
                $0 + (visited.insert($1).inserted ? visit($1) : 0) 
                }
                return seconds + (edge > 0 && (seconds > 0 || hasApple[edge]) ? 2 : 0)
        }

        return visit(0)    
    }
}