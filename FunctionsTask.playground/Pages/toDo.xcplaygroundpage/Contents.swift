import UIKit

protocol HomeworkService {
    // Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)

    // Функция должна вернуть числа фибоначчи.
    func fibonacci(n: Int) -> [Int]

    // Функция должна выполнить сортировку пузырьком.
    func sort(rawArray: [Int]) -> [Int]

    // Функция должна преобразовать массив строк в массив первых символов строки.
    func firstLetter(strings: [String]) -> [Character]

    // Функция должна отфильтровать массив по условию, которое приходит в параметре `condition`. (Нельзя юзать `filter` у `Array`)
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
}



struct HomeworkServiceStruct:  HomeworkService{
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        let firstPart = x / y;
        let secondPart = x % y;
        
        return (firstPart, secondPart)
    }
    
    
    func fibonacci(n: Int) -> [Int] {
        var mass: [Int] = [1, 1]
        if n <= 0 {
            return []
        } else if n == 1 {
            return [1]
        }
        for i in 2..<n {
            mass.append(mass[i-1] + mass[i-2])
        }
        return mass
    }
    
    
    func sort(rawArray: [Int]) -> [Int] {
        var newRawArray = rawArray
        for i in 0..<newRawArray.count-1{
            var flag = false
            for j in 0..<newRawArray.count-i-1{
                if newRawArray[j] > newRawArray[j+1] {
                    flag = true
                    var x: Int = newRawArray[j]
                    newRawArray[j] = newRawArray[j+1]
                    newRawArray[j+1] = x
                }
            }
            if !flag{
                break
            }
        }
        
        return newRawArray
    }
    
    
    func firstLetter(strings: [String]) -> [Character] {
        var mass: [Character] = []
        for i in 0..<strings.count{
            if let char = strings[i].first {
                mass.append(char)
            }
        }
        
        return mass
    }
    
    
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
        var filteredMass:[Int] = []
        
        for elem in array {
            if condition(elem) {
                filteredMass.append(elem)
            }
        }
        
        return filteredMass
    }
    
    
}

let result = HomeworkServiceStruct()

result.divideWithRemainder(10, by: 3)
result.fibonacci(n: 10)
result.sort(rawArray: [1, 2, 6, 35, 1, 5, -1])
result.firstLetter(strings: ["udbidib", "dufdbfvd", "idffbvufdvfvf", ""])
result.filter(array: [1, 2, 3, 4, 5], condition: {int in
    return int % 2 == 0
})
