package com.example.lovedeathrobots

import java.lang.Integer.min
import java.util.*

class Kripteau {

    fun crypter(s: String, k: String): String{
        var sb = _str2vec(s)
        var kb = _str2vec(k)
        var o = byteArrayOf()
        for (i in 0..(sb.size-1) step 2) {
            val v = listOf(sb[i], sb[i+1])
            o += _vec2str(_crypter(v, kb))
        }
        return String(Base64.getEncoder().encode(o))
    }
    fun _crypter(v: List<Long>, k: List<Long>): List<Long>{
        val d: Long = (0xBC7F2023).toLong()
        var y: Long = v[0]
        var z: Long = v[1]
        var sum: Long = 0L
        for (x in 32 downTo 1) {
            sum += d
            y = ((y + ((((z shl 4) + k[0]) xor (z + sum)) xor ((z shr 5) + k[1]))) and 0xFFFFFFFF)
            z = ((z + ((((y shl 4) + k[2]) xor (y + sum)) xor ((y shr 5) + k[3]))) and 0xFFFFFFFF)
        }
        return listOf(y, z)
    }
    fun _str2vec(s: String):  List<Long>{
        val charset = Charsets.UTF_8
        var n = s.length
        // Split the string into chunks
        var numchunks = kotlin.math.ceil((n.toDouble() / 4)).toInt()
        var chunks: Array<ByteArray> = arrayOf()
        for (i in 0..(numchunks-1)){
            val sub = s.substring(4 * i, min(4 * (i + 1), n))
            chunks += (sub).toByteArray(charset)
        }
        var v: List<Long> = listOf()
        for (c in chunks){
            var i = 0L
            var s = 0L
            for (l in c){
                s += (l.toLong() shl ((8 * i).toInt()))
                i++
            }
            v += s
        }
        return v
    }
    fun _vec2str(v: List<Long>): ByteArray{
        var o = byteArrayOf()
        for (elt in v){
            for (i in 0..4){
                var b = ((elt shr (8 * i))).toByte()
                if (b != 0.toByte())
                    o += b
            }
        }
        return o
    }
}