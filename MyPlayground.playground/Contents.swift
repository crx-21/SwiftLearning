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
//Closer-ul nostru travel stie deja ca asteptam ca param un String, returnam un String
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
