
import strutils
import parseutils
import sequtils

proc execute(program: seq[int] , noun: int, verb: int) : int =
    var p = program
    p[1] = noun
    p[2] = verb
    var ip = 0
    while p[ip] != 99:
        if p[ip] == 1:
            p[p[ip+3]] = p[p[ip+1]] + p[p[ip+2]]
            ip += 4
        else:
            if p[ip] == 2:
                p[p[ip+3]] = p[p[ip+1]] * p[p[ip+2]]
                ip += 4       
            else:
                echo "ERROR"
                return 0
    return p[0]    

let f = open("input.txt")
let line = f.readLine()
f.close()
let program = line.split({','}).map(parseInt)
let result = execute(program,2,12)
echo "task 1: result = ", result

let target = 19690720

for i in 0..99:
    for j in 0..99:
        let res = execute(program,i,j)
        if res == target:
            echo "task2 , result = ",i, " " , j, " => ", target
            


