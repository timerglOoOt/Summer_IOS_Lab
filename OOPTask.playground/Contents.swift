import UIKit

var number = 0
class LibraryItem: Equatable, ChangeAccess{

    let title: String
    let author: String
    
    var isAccess: Access
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
        self.isAccess = .availible
    }
    
    func checkIn() {
        isAccess = .notAvailable
    }
    
    func checkOut() {
        isAccess = .availible
    }
    
    func delete() {
        isAccess = .notExsist
    }
    
    static func == (lhs: LibraryItem, rhs: LibraryItem) -> Bool {
        lhs.title == rhs.title && lhs.author == lhs.author
    }
    
}


class Book: LibraryItem {
    var genre: Genre
    
    init(title: String, author: String, genre: Genre) {
        self.genre = genre
        super.init(title: title, author: author)
    }
    
    func getGenre() -> Genre{
        return genre
    }
    
    override func checkIn() {
        super.checkIn()
        print("Книга \(title) \(author) была взята!")
    }
    
    override func checkOut() {
        super.checkOut()
        print("Книга \(title) \(author) на базе!")
    }
    
    override func delete() {
        super.delete()
        print("Книга \(title) \(author) улетела на радугу!")
    }
}

class Magazine: LibraryItem {
    var issueNumber: Int
    
    init(title: String, author: String, issueNumber: Int) {
        self.issueNumber = issueNumber
        super.init(title: title, author: author)
    }
    
    // Переопределять функции не буду, видно и выше, что могу
}

class Stationery {
    private let category: Stuff
    private var price: Int
    
    init (category: Stuff, price: Int) {
        self.category = category
        self.price = price
    }
    
    func getPrice() -> Int {
        return price
    }
    
    func setPrice(newPrice: Int) {
        if newPrice > 0 {
            price = newPrice
        } else {
            print ("Неверная цена!")
        }
    }
    
    func getCategory() -> Stuff {
        return category
    }
}


class NationalLibrary {
    private var rooms: [Room] = []
    private var library: Library
    
    init (rooms: [Room], library: Library) {
        self.library = library
        self.rooms = rooms
    }
    
    func getAllLibraryItems () -> [LibraryItem] {
        library.getAll()
    }
    
    func getAllRooms () -> [Room] {
        return rooms
    }
}


/*--------------------------------------------------------------*/

struct Reader {
    let name: String
    public var age: Int
    private var id: Int = Counter().counter()
    private var listOfLibraryItems: [LibraryItem] = []
    
    init (name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    mutating func appendItem (item: LibraryItem) {
        if item.isAccess == .availible {
            listOfLibraryItems.append(item)
            listOfLibraryItems.last?.checkIn()
        }
    }
    
    func getListOfLibraryItems () -> [LibraryItem] {
        return listOfLibraryItems
    }
    
    func getId() -> Int{
        return id
    }
}


struct Library {
    private var library: [LibraryItem] = []
    
    mutating func addItem(item: LibraryItem) {
        library.append(item)
        item.checkOut()
    }
    
    func removeItem(item: LibraryItem) {
        for i in 0..<library.count {
            if library[i] == item {
                library[i].delete()
            }
        }
    }
    
    func getById(id: Int) -> LibraryItem {
        return library[id]
    }
    func getAll() -> [LibraryItem] {
        return library
    }
}


struct Room {
    fileprivate var numberOfComputers: Int
    fileprivate var numberOfTables: Int
    fileprivate let roomNumber: Int
    
    mutating func setNumberOfComputers(newNumber: Int) {
        if newNumber >= 0 {
            numberOfComputers = newNumber
        } else {
            print("Введено неверное кол-во компьютеров!")
        }
    }
    
    mutating func setNumberOfTables(newNumber: Int) {
        if newNumber >= 0 {
            numberOfTables = newNumber
        } else {
            print("Введено неверное кол-во столов!")
        }
    }
}


struct Counter: IdCounter{
    func counter() -> Int{
        number += 1
        return number
    }
}

/*--------------------------------------------------------------*/

protocol IdCounter {
    func counter() -> Int
}

protocol ChangeAccess {
    func checkIn()
    func checkOut()
    func delete()
}

/*--------------------------------------------------------------*/

enum Genre{
    case fiction
    case fantasy
    case horror
    case detective
    case comedy
    case drama
}

enum Access {
    case availible
    case notAvailable
    case notExsist
}

enum Stuff {
    case pen
    case notebook
    case eraser
    case pencilCase
}

/*--------------------------------------------------------------*/

var reader1 = Reader(name: "Timur", age: 18)
var reader2 = Reader(name: "Oleg", age: 24)

var library = Library()

var book1 = Book(title: "Горе от ума", author: "Грибоедов", genre: .comedy)
var book2 = Book(title: "Великий Гэтсби", author: "Фицджеральд", genre: .drama)
var magazine1 = Magazine(title: "Квант", author: "Татарский народ", issueNumber: 17)

library = Library()

library.addItem(item: book1)
library.addItem(item: book2)
library.addItem(item: magazine1)

library.getAll()


reader1.appendItem(item: library.getById(id: 0))

reader2.appendItem(item: library.getById(id: 0))

