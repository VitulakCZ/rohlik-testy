import scala.io.StdIn.readLine
import RohlikyPenize.*

enum RohlikyPenize:
    case Rohliky, Penize

def checkInt(rohlikyPenize: RohlikyPenize): Option[Number] =
    print(if rohlikyPenize == Rohliky then "Kolik rohlíků? " else "Kolik zaplatíš? ")
    try
        Some(readLine().toInt)
    catch
        case _: NumberFormatException =>
            println("Jsi kokot!")
            None

def loop(rohlikyPenize: RohlikyPenize): Array[Int] =
    var odpocet = if rohlikyPenize == Rohliky then 2 else 1
    var kdeJsme = rohlikyPenize
    val pocetCena = Array[Int](0, 0)
    while odpocet > 0 do
        val r = checkInt(kdeJsme).orNull
        if r != null then
            pocetCena(2 / odpocet - 1) = r.intValue()
            kdeJsme = if kdeJsme == Penize then Rohliky else Penize
            odpocet -= 1
    pocetCena

def isPenize(pocetCena: Array[Int]): Boolean =
    pocetCena(1) >= pocetCena(0) * 3

@main
def main(): Unit =
    var pocetCena = loop(Rohliky)

    if isPenize(pocetCena) then
        println(pocetCena(0))
    else
        var run = true
        while run do
            print("To nestačí, zaplať víc! Z = Znovu, C = Změnit cenu, E = Exit: ")
            val input: String = readLine().toUpperCase()

            input match
                case "Z" => pocetCena = loop(Rohliky)
                case "C" => pocetCena(1) = loop(Penize)(1)
                case "E" => run = false
                case _ => println("Jsi kokot!")

            if isPenize(pocetCena) then
                println(pocetCena(0))
                run = false
