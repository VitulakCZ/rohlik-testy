import RohlikyPenize.*

enum class RohlikyPenize {
    Rohliky, Penize
}

fun checkInt(rohlikyPenize: RohlikyPenize): Number? {
    print(if (rohlikyPenize == Rohliky) "Kolik rohlíků? " else "Kolik zaplatíš? ")
    try {
        return readlnOrNull()?.toInt()
    }
    catch (e: NumberFormatException) {
        println("Jsi kokot!")
        return null
    }
}

fun loop(rohlikyPenize: RohlikyPenize): MutableList<Int> {
    var odpocet = if (rohlikyPenize == Rohliky) 2 else 1
    var kdeJsme = rohlikyPenize
    val pocetCena = mutableListOf(0, 0)
    while (odpocet > 0) {
        val r = checkInt(kdeJsme)
        if (r != null) {
            pocetCena[2 / odpocet - 1] = r.toInt()
            kdeJsme = if (kdeJsme == Penize) Rohliky else Penize
            odpocet -= 1
        }
    }
    return pocetCena
}

fun isPenize(pocetCena: List<Int>): Boolean = pocetCena[1] >= pocetCena[0] * 3

fun main() {
    var pocetCena = loop(Rohliky).toMutableList()

    if (isPenize(pocetCena)) {
        println(pocetCena[0])
    } else {
        var run = true
        while (run) {
            print("To nestačí, zaplať víc! Z = Znovu, C = Změnit cenu, E = Exit: ")
            val input = readlnOrNull()?.uppercase()

            when (input) {
                "Z" -> pocetCena = loop(Rohliky)
                "C" -> pocetCena[1] = loop(Penize)[1]
                "E" -> run = false
                else -> println("Jsi kokot!")
            }

            if (isPenize(pocetCena)) {
                println(pocetCena[0])
                run = false
            }
        }
    }
}