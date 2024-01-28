class InversePairs {
    fun printInversePairs(word: String) {
        val length = word.length
        for (i in 0 until length / 2) {
            println("${word[i]}-${word[length - 1 - i]}")
        }
    }
}
