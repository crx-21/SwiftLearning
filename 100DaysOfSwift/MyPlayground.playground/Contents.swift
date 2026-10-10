import UIKit

var greeting = "Hello, playground"
var suntunInt=55
var suntunString="Hello Man"

//folosim var pentru a declara o variabila, ca si in python se asigneaza tipul in functie de valoarea variabilei

suntunInt=39
suntunString="John Cena"

//nu mai e nevoie sa folosim var inca odata pentru reasignare/lucru

var numarMare=1_000_000
//Tot un milion reprezinta, insa e mai usor vizibil in cod datorita _

var suntunStringLung="""
Hello sunt cel mai lung
string 
existent, salut!
"""
//Folosim """ pentru string-uri pe linii multiple """ trebuie sa fie fiecare pe linia lui propie

var suntunStringLung2="""
Salut \
Ce mai faci \
Bn tu?
"""

//Cu backslash putem 'concatena' textul mai lung

var suntunDouble=3.66653252

//Implicit se assigneaza double la o valoare cu virgula

var suntunBool=true

var notaExamen=5
var testResult="Nota ta la test este: \(notaExamen)"

//Putem introduce valori direct in string cu sintaxa \(numeVar)

let unchangableVariable=39

//unchangableVariable=3 Da eroare, o valoare constanta nu poate fi schimbata. O buna practica e sa lucram cu let daca stim ca o var nu se va schimba. Odata stabilit tipul constantei nu o sa putem sa il schimbam.

//Declarare explicita variabile

let str1 : String="Salut"
let bool1: Bool=true
let int1: Int=33
let float1: Float=2.56
let double1: Double=5.55

//Arrays:
var student1="Cristian"
var stud2="Totulica"
var stud3="Mongol"
var stud4="Marcus Aurelius"
    //Indexarea porneste de la 0 in swift
var array=[student1,stud2,stud3,stud4]
array[1] // accesam elementul nr 1 din array
//Seturi:
let celebritati=Set(["Michael Jackson","John Cena","Undertaker"])
//Daca punem duplicates sunt ignorate automat:
let celebritati2=Set(["Michael Jackson","John Cena","Undertaker","Michael Jackson","John Cena","Michael Jackson","John Cena"])

//Acesta e un tuple, este format din mai multe valori, tipurile nu pot fi schimbate sunt size fixed.

var tupleul=(text: "Ai atatia ani:", varsta:10)
//Accesari tuple:
tupleul.0 //accesam textul dupa index
tupleul.varsta //accesam varsta dupa nume
tupleul.varsta=30
tupleul

//Arrays - Folosite pentru o colectie de date unde nu ne intereseaza daca avem duplicate.
//Tuple - folosim cand dorim sa avem o sursa centralizata de date pentru un anumit obiect de exemplu si sa asociem toate datele legate de tuple
//Set - folosim cand dorim o colectie de date unica.

//Dictionaries:
let dictionary = [
    "Michael Jackson": 23,
    "CrX":21
]

//Syntax: dictionary= [
//key: Value
//]

//Asemanatoare cu hashset insa noi decidem cu ce valoare le accesam

dictionary["CrX"]

//In mod default daca cautam o cheie care nu exista programul ne va returna nil, putem specifica o valoare default daca nu este gasita:

let dictionary2=["John":"Cena","Michael":"Jackson"]
dictionary2["Albert",default: "Unknown"]

//Empty Collections:
//Dictionar + Adaugare entry:
var team=[String:String]()
var team2=Dictionary<String,String>()
team["Cristian"]="Szanto"
//Array:
var array2=[Int]()
var array3=Array<Int>()
array2.append(21)
array2.append(22)
//Seturi:
var set1=Set<String>()
var set2=Set<Int>()

//Enums sunt grupuri de valori pentru atributie a nu se confunda cu switch
enum RezultatExamen{
    case Picat
    case Trecut
    case Incert
}

let stareStudent=RezultatExamen.Trecut

    //Putem asocia valori unui enum:

enum RezultatExamen2{
    case Picat(Nota: Int)
    case Trecut(Nota:Int)
    case Incert(Mesaj:String)
}

let RezultatStudent1=RezultatExamen2.Picat(Nota: 3)

//Enum cu valori dinamice:
//rau va fi 2, mediu 3 etc...
enum NotePosibileExamen:Int{
    case naspa = 1
    case rau
    case mediu
    case bun
    case excelent
}

//sau:

let excelent=NotePosibileExamen.RawValue(10)

//Arithmetic operators:
// + - / * % functioneaza exact ca si in celelalte limbaje

//Operator overloading:
//+ poate fi folosit si la ce cunosteam initial dar si la concatenare Strings, si arrays atata timp cat tipurile sunt the same:

let firsthalf=["John","Cena"]
let secondhalf=["The", "Big","Show"]
let wwe=firsthalf+secondhalf

//Compound Operators:
//-= += /= *= nu folosim ++ sau -- pentru astea avem -= si +=
var nr=5
var nr2=5
//Operatori Comparatie:
//==,!=, <=, >=, <, >

//folosim print() pentru afisari
//if,else if,else exact ca in celelalte limbaje
//&& || exact aceleasi functionalitati
// operator ternar same functions: conditie ? daca true executa : daca false executa

//Switch
//Aceleasi functionalitatii de case si default doar ca se adauga in plus cuvantul fallthrough
var weather="snow"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}
//folosim cand vrem sa continuam executia din urmatorul case, swift nu are nevoie de keywords ca si break sau exit pentru a iesi din case

//Range Operators:
let score = 85

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
//folositi des cu switch. Range Operators contin numere cuprinse intre x..<x+n sau x...n
let count = 1...10
for number in count{
    print("Number is \(number)")
}

//daca nu vrem sa folosim constanta pe care for-ul ne-o da putem folosi "_"

for _ in 1...5{
    print("Salut sunt CrX")
}

//while e the same
var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("Ready or not, here I come!")

//do while e basically repeat in swift iar sintaxa pentru el este:
var number2 = 1

repeat {
    print(number2)
    number2 += 1
} while number2 <= 20

print("Ready or not, here I come!")
//keyword break the same ca in alte limbaje

//Exiting loops
//Pentru a iesi din mai multe loop-uri putem asigna label-uri loop-urilor:
loopExtern: for i in 1...10{
    loopIntern: for j in 1...10{
        let produs = i*j
        print("\(i) * \(j) is \(produs)")
        if(produs==50){
            print("Ce tare ai nimerit fix 50")
            break loopExtern
        }
            else if(produs==60){
                print("Nu imi place")
                break loopIntern
            }
        
    }
    
}
//continue, keywordu acesta este folosit pentru a sarii peste un element de exemplu
for i in 1...10{
    if(i%2==0) {
        continue
    }
    print(i)
}

//Functii
//folosim keyword-ul func

func SalutariDeLaCrax()
{
    let message="""
        Yo bun venit la primul meu program din swift.
        Sper sa inveti ceva nou twin.
        Buh bye!
        """
    print(message)
}
SalutariDeLaCrax()

//Ca la python asignarea de valori:
func suma(nr1:Int,nr2:Int)
{
    var suma=nr1+nr2
    print(suma)
}
suma(nr1:5,nr2:9)

//Functii cu return:
func diff(nr1:Int,nr2:Int) -> Int
{
    var diff=nr1-nr2
    return diff
}
var rezultat=diff(nr1:8,nr2:5)
print(rezultat)

//Parameter Labels:
//Swift ne pune la dispozitie cate doi parametrii unul pentru apel intern iar altul pentru apel extern

func SalutaOamenii(pe name: String)
{
    print("Hello \(name)!")
}

SalutaOamenii(pe: "John")

//sintaxa: func numfunc(param extern param intern: tip)

//Omitting Parameter labels:
//Putem omite parametrul de mai inainte printr-un simplu _ si sa folosim strict name:

func SalutaOamenii(_ name: String)
{
    print("Hello \(name)!")
}
//Observam si function overloading
SalutaOamenii("John")

//Despre print()
//Mereu va incepe linie noua cand va fi apelat datorita la keywordul terminator
//Putem asigna valori default pentru functie in acest fel:
func SalutaOamenii(_ name: String, esteCuminte:Bool = true)
{
    if(esteCuminte){
        print("Hello \(name)!")
    }
    else
    {
        print("P-asta (\(name) nu il salut ca ma supara")
    }
}

SalutaOamenii("Totulica",esteCuminte: false)

//Functii variadice, aceste functii accepta mai multe valori din acelasi tip, exemplu:
func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square(numbers: 1,2,3,4,5)
//Functii care arunca erori:
//Creeam prima oara un enum care contine erorile posibile pe care le cunoastem:
enum Errors:Error{
    case passerr
    
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw Errors.passerr
    }

    return true
}

//In swift se introduce keyword-ul "do" care e folosit imp cu try catch. Cu do stabilim portiunea de cod care poate arunca errori, adaugam try la posibile functii care vor da erori iar catch il folosim pentru a prinde errorile
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
} //Nu se va executa niciodata partea de that pass is good in acest caz pentru ca s-a prins o eroare

//Parametrii pe care ii adaugam in functii sunt constante => nu ii putem schimba => daca vrem sa facem asta, folosim inout => orice modificare a variabilei in functie va fi permanenta
func cresteCuCate3de3Ori(numarul: inout Int)->Int{
    for i in 1...3{
        numarul*=3
    }
  return numarul
}
var nrMeu=5
cresteCuCate3de3Ori(numarul: &nrMeu)

//Closures:
//Closures sunt functii care pot fi apelate in interiorul altor functii,asignate variabilelor si apelate cu ajutorul lor:
let driving = {
    print("Conduc polozauru prin sibiu")
}

driving()
//Si uite asa avem o functie fara nume/parametrii
//Pentru a permite unui closure sa aiba parametrii trebuie sa folosim keyword-ul "in"

let driving2 = { (place:String ) in
    print("Conduc polozauru prin \(place)")
}
driving2("Brasov")

//Daca vrem sa si returnam ceva intr-o functie closure putem face:
let drivingReturn={ (place:String) -> String in
    return "Conduc polozauru prin \(place)"
}
let mesaj=drivingReturn("Bucuresti")
print(mesaj)
//Functie in functie folosind closure:
//Pentru asta creeam functia travel
func travel(action:()->Void){
    print("Pregatit plecare")
    action()
    print("Am ajuns")
}
travel(action: driving)
//In functia de mai sus ne-am folosit de functii closure in functii closure dar fara parametrii,acum ne vom folosii de parametrii:
func travel(action:(String)-> Void){
    //Acum asteptam un string si returnam void:
    print("Pregatit plecare")
    action("Orastie")
    print("Am ajuns")
}

travel(action: driving2)

func travel(action:(String)-> String)
{
    print("Prgatit de plecare")
    let description=action("Hurghada")
    print(description)
    print("Am ajuns bro!")
}
travel{(place:String )-> String in
return "Am plecat spre \(place)"
}

//cand am apelat functia de mai sus ne-am complicat, am putea folosi shorthand parameter names ca sa simplificam situatia.
//Closure-ul nostru travel stie deja ca asteptam ca param un String, returnam un String
travel{
    "Am plecat spre \($0)"
}

//=> putem sa lasam swift sa aleaga prin \($0) parametrul, in cazu acesta avem doar unul si il accesam prin sintaxa anterioara
//Closure cu mai multi parametrii:
func travel(action:(String,Int)-> String)
{
    print("Prgatit de plecare")
    let description=action("Hurghada",60)
    print(description)
    print("Am ajuns bro!")
}

travel{
    "Am plecat spre \($0) cu o viteza de \($1) kmh"
}

//returnare closure from a function:
func travel() -> (String) -> Void{
    return {
        print("Plec spre \($0)")
    }
}
let result = travel()
result("Oradea")

//Capturing values closures:
//Se intampla cand creeam valori in functie, acestea pot fi folosit si in closure
func travel2() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

result("Sibiu")
result("Sibiu")
result("Sibiu") //va creste counter-ul de mai sus de fiecare data

//Structuri:

struct Sport{
    //normal properties
    var name:String
    var matchdate:String
    var numberofleagues:Int
    //computed property (ia diferite valori in functie de alti factori):
    var esteSportOlympic:String {
        if(numberofleagues>5)
        {
            return "\(name) este un sport olimpic"
        }
        else
        {
            return "\(name) nu este un sport olimpic"
        }
            
    }
}

var tennis=Sport(name: "Tennis",matchdate:"21/01/2005",numberofleagues: 5)
tennis.name="Tenis de camp"
print(tennis.esteSportOlympic)

var fotbal=Sport(name: "Fotbal",matchdate:"22/01/2006",numberofleagues: 6)
print(fotbal.esteSportOlympic)

//Property observers. Observa o aplicatie si ruleaza un anumit cod stabilit de programator in momentul in care se observa o schimbare la variabila
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
//folosim keywordul didSet si stabilim codul de rulat cand se schimba var.
//mai exista si willSet care ruleaza codul inainte de schimbarea var, insa acesta e folosit rar.


//Metode
struct City{
    var name:String
    var population:Int
    func collectTaxes() -> Int
    {
        var taxmoney=population*1000
        return taxmoney
    }
    /*func schimbaOras()->Void
    {
        name="Oradea"
    }*/ //Da eroare
}

var Oras=City(name: "Sibiu", population: 30000)
print("\(Oras.collectTaxes())$ atatia bani au fost colectati de la populatie")
//Instantele vor fi constante la initializare => nu putem sa le schimbam, vezi mai sus problema
//Un work around la aceasta problema este keyword-ul mutating, folosit cu functii pentru a schimba o var:
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}
var person = Person(name: "Ed")
person.makeAnonymous()

//string-urile sunt structuri in swift ceea ce inseamna ca au diferite metode:
let stringtest="John Cena te saluta"
print("Informatii string:")
print(stringtest.isEmpty)
print(stringtest.count)
print(stringtest.contains("Cena"))
print(stringtest.lowercased())
//si arrays-urile sunt structuri si au mai multe metode, check em out cu "." si xcode autocomplete
//Initializers (Constructors)

    struct User{
        var username:String
        //Constructor fara param
        init()
        {
            username="Unknown"
            print("S-a creat un nou user")
        }
        //Constructor cu param
        init(username:String)
        {
            print("\(username), s-a inregistrat cu succes!")
            self.username=username
        }
        
    }

//Lazy properties (performance optimization)
//Exemplu: folosim o alta structura in alta structura

struct Group{
    init()
    {
        print("S-a creat grupul")
    }
}

struct UserAdvanced{
    var username:String
    lazy var group=Group() //Deci se creeaza pentru fiecare obiect aceasta instantiere a lui Group => performanta scazuta. putem repara asta cu keywordul lazy care va initializa doar cand obiectul va apela proprietatea
    //Constructor fara param
    init()
    {
        username="Unknown"
        print("S-a creat un nou user")
    }
    //Constructor cu param
    init(username:String)
    {
        print("\(username), s-a inregistrat cu succes!")
        self.username=username
    }
    
    
    
}

var CrX=UserAdvanced(username: "CrX")
CrX.group

//Static: Folosit pentru a da share la proprietati si metode peste mai multe instante ale structurii
struct Student{
    //Swift 6 error: Static property 'studentiInClasa' is not concurrency-safe because it is nonisolated global shared mutable state
    nonisolated(unsafe) static var studentiClasa=0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.studentiClasa = Student.studentiClasa + 1
    }
}

//Access control ca si in alte limbaje, private, public pe langa acestea mai dispunem de fileprivate,internal (default access control for everything), open similar cu public dar clasele si metodele pot fi subclasate si overridded din defining module

struct Person2{
    private var id:String
    init(id:String)
    {
        self.id=id
    }
    //id este accesibil doar struct=>
    func getId()->String
    {
        return id
    }
    mutating func setId(newid:String)->Void
    {
        id=newid
    }
    func afisId()->Void
    {
        print(id)
    }
}

var RandomGuy=Person2(id:"1")
RandomGuy.afisId()
RandomGuy.setId(newid: "523362368588883")
RandomGuy.afisId()
var idofguy=RandomGuy.getId()

//Clase
//Same ca in celelalte limbaje, mostenirea e de tipul
//class Animal:Dog
//Constructori cu init ca si la struct, doar ca pentru clase mostenite folosim super.init, pentru ca nu mai avem declaratie ci apel direct din clasa parinte
class Animal{
    var name:String
    var age:Int
    var sound:String
    
    init(name:String,age:Int,sound:String = "Generic Animal Sound")
    {
        self.name=name
        self.age=age
        self.sound=sound
    }
    
    func makeSound()
    {
        print(sound)
    }
}

class Dog:Animal{
    var breed:String
    init(name:String,age:Int,sound:String,breed:String){
       self.breed=breed
       super.init(name: name, age: age, sound: "Bark!")
    }
    override func makeSound() {
        print(sound)
        print("Not only i overridded the makeSound func but i also barked twin")
    }
}

//cand vrem sa oprim mostenirea unei clase folosim keyword-ul final:

final class CrazyDog:Dog
{
    var ability:String
    init(name:String,age:Int,sound:String,breed:String,ability:String)
    {
        self.ability=ability
        super.init(name:name,age:age,sound:sound,breed:breed)
    }
    
    deinit{
        print("Obiectul a fost distrus")
    }
}
//Copying objects. Cand copiem un struct originalul si copia sunt diferite insa la clase ele pointeaza spre acelasi lucru
var Chupacabra=Animal(name: "Chupi", age: 1000)
print(Chupacabra.name)
var ChupacabraCopy=Chupacabra
ChupacabraCopy.name="Chupi Copy"
print(ChupacabraCopy.name)

//daca faceam cu struct am fi vazut chupi de doua ori.

//Destructori: Deinitializers, folositi cu keywordul deinit() vezi mai sus
//!!!!Clasele n-au nevoie de mutating, deoarece daca clasa e constanta si proprietatile sunt variabile acestea pot fi schimbate, daca vrem constante atunci e mai bine sa le declaram direct cu let

//Protocols - folosite pentru a descrie ceea ce trebuie sa aiba proprietatile si metodele apoi transmitem limbajului ce tipuri trebuie sa respecte aceste protocoale

protocol Identifiable {
    var id:String { get set }

}

struct UserProtocol:Identifiable{
    var id:String
    
    func displayId(thing: Identifiable)
    {
        print("Id-ul este: \(id)")
    }
}

var user3=UserProtocol(id: "5325235")
user3.displayId(thing:user3)

//Mostenire protocoale

protocol MustPass{
    func checkifPassed()->Bool
}

protocol HasSchoolVacation{
    func checkifVacation()-> Bool
}

protocol eligibileforBursa{
    func eligibleBursa(note: Array<Double>,checkIntegralist: Bool) -> Bool
}

class StudentAdvanced:MustPass,HasSchoolVacation,eligibileforBursa{
    var name:String
    var age:Int
    var note:Array<Int>
    
    init(name: String, age: Int, note: Array<Int>) {
        self.name = name
        self.age = age
        self.note = note
    }
    
    func checkifPassed() -> Bool {
        return true
    }
    
    func checkifVacation()->Bool
    {
        return true
    }
    
    func eligibleBursa(note: Array<Double>, checkIntegralist: Bool) -> Bool {
        return true
    }
}

//Extensions: folosite pentru a adauga metode la tipuri deja existente pentru a le face sa faca ceva ce n-ar fi putut in mod normal sa faca, basically metode custom ptr tipuri

extension Int{
    func squared()-> Int {
        return self*self
    }
}

var x=5
//ne apelam functia custom pentru int:
print(x.squared())

//nu avem voie sa creeam variabile noi in extensii
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}
//dar le putem folosi ca si computed properties ca in exemplul de mai sus


//Protocol extensions - aparute din cauza inabilitati de a folosii protocols la mai multe tipuri de data.

//refolosim array-urile si seturile de mai sus din program:

extension Collection{
    func summarize()
    {
        print("There are \(count) elements")
        
        for name in self
        {
            print(name,terminator: " ") //putem specifica cum sa separam elem terminator
        }
    }
}

array.summarize()
celebritati.summarize()

protocol IdentifiableAdvanced
{
    var id:String{get set}
    func identify()
}

extension IdentifiableAdvanced{
    func identify()
    {
        print("My id: \(id)")
    }
}

struct TestProtExt:IdentifiableAdvanced{
    var id:String
    
}

let Test=TestProtExt(id:"1232333")
print("") // din cauza ca terminatorul din ultimul print l-am schimbat in -> " " 
Test.identify()

//Optionals:
//Syntax:
var varsta:Int? = nil
//momentan nu stocam nimic in varsta

//Cand vrem sa lucram cu un string optional de exemplu vom fi opriti de swift ca safety feature, un mod de-a trece de acest wall e unwrapping:
var nume:String? = nil
//practic vom pune string-ul existent din nume daca exista unul in unwrapped
if let unwrapped = nume {
    print("\(unwrapped.count) am atatea litere in nume")
}
else
{
    print("Missing name")
}

//Alternativa la unwrapping ar fi unwrapping cu guard
//Folosim keyword guard dar daca detecteaza un nil se asteapta sa iesim din functie,loop sau conditia in care l-am folosit

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}

//Force unwrapping cand suntem siguri ca avem o anumita valoare intr-o var optionala o putem converti dintr-un tip optional in tip non-optional:

let str=5
let num=Int(exactly: str)! //pentru ca swift nu stie daca str e 100% un int converteste num in optional, insa noi putem vedea in cod ca e safe atunci adaugam un "!"

//Implicitly unwrapped optionals:
let age:Int! = nil
//putem folosi fara if let sau guard let, dar daca valoarea e 100% nil vom primi un crash

//Nil coalescing:
//face unwrapping la optional si returneaza o valoare din "el"
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

print(username(for: 1))
print(username(for: 0))

//Observam ca este printat nil pentru for: 0 dar putem declara o valoare default in urmatorul fel:
let user = username(for: 15) ?? "Anonymous"

//Optional chaining:
let vector=["Ionut", "John","Marcel","Alex"]
let arandomguy=vector.first?.uppercased()
//daca primim nil pe vector.first atunci numele nu va fi uppercased iar 'arandomguy' va fi setata pe nil


//Try optional:
//Schimba functiile din throw in optionale care vor returna nil ca si rezultat sau valoarea wrapped ca si optional

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("parola") //stim sigur ca parola!=password
print("Ok")

/*try! checkPassword("password")
print("Oh no")  */ //da crash

//Failable initializer, deoarece am vazut ca putem folosi force unwrapping pentru variabile optionale acestea pot fi folosite si pentru initializers (constructori) prin urm sintaxa:
//init?()
//{
//
//}

struct FailablePerson {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

var testOpt=FailablePerson(id:"123456789")
print(testOpt)
var testOpt2=FailablePerson(id:"2")
print(testOpt2)

//Typecasting:
//Keyword-ul "as?" este folosit atunci cand avem un array de obiecte de diferite type-uri, si trebuie sa verificam care face parte dintr-un anumit type:
//folosim clasele urm:

class Human{}
class Professor:Human{}
class Student2:Human{func makeHomework(){print("Gata Tema")}}

let people=[Human(),Professor(),Human(),Student2(),Professor()]

for person in people {
    if let student=person as? Student2{
        student.makeHomework()
    }
}

//typecast-ul a reusit se printeaza Gata tema


