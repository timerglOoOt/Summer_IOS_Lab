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
        <#code#>
    }
    
    func fibonacci(n: Int) -> [Int] {
        <#code#>
    }
    
    func sort(rawArray: [Int]) -> [Int] {
        <#code#>
    }
    
    func firstLetter(strings: [String]) -> [Character] {
        <#code#>
    }
    
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
        <#code#>
    }
    
    
}
