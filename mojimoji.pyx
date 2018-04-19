# distutils: language=c++
# -*- coding: utf-8 -*-

from libc.stdlib cimport malloc, free

cdef extern from "<tr1/unordered_map>" namespace "std::tr1":
    cdef cppclass unordered_map[T, U]:
        U& operator[](T&) nogil
        size_t count(T&) nogil

ctypedef unordered_map[Py_UNICODE, Py_UNICODE] table_type


ASCII_ZENKAKU_CHARS = (
    u'ａ', u'ｂ', u'ｃ', u'ｄ', u'ｅ', u'ｆ', u'ｇ', u'ｈ', u'ｉ', u'ｊ', u'ｋ',
    u'ｌ', u'ｍ', u'ｎ', u'ｏ', u'ｐ', u'ｑ', u'ｒ', u'ｓ', u'ｔ', u'ｕ', u'ｖ',
    u'ｗ', u'ｘ', u'ｙ', u'ｚ',
    u'Ａ', u'Ｂ', u'Ｃ', u'Ｄ', u'Ｅ', u'Ｆ', u'Ｇ', u'Ｈ', u'Ｉ', u'Ｊ', u'Ｋ',
    u'Ｌ', u'Ｍ', u'Ｎ', u'Ｏ', u'Ｐ', u'Ｑ', u'Ｒ', u'Ｓ', u'Ｔ', u'Ｕ', u'Ｖ',
    u'Ｗ', u'Ｘ', u'Ｙ', u'Ｚ',
    u'！', u'”', u'＃', u'＄', u'％', u'＆', u'’', u'（', u'）', u'＊', u'＋',
    u'，', u'－', u'．', u'／', u'：', u'；', u'＜', u'＝', u'＞', u'？', u'＠',
    u'［', u'￥', u'］', u'＾', u'＿', u'‘', u'｛', u'｜', u'｝', u'～', u'　'
)

ASCII_HANKAKU_CHARS = (
    u'a', u'b', u'c', u'd', u'e', u'f', u'g', u'h', u'i', u'j', u'k',
    u'l', u'm', u'n', u'o', u'p', u'q', u'r', u's', u't', u'u', u'v',
    u'w', u'x', u'y', u'z',
    u'A', u'B', u'C', u'D', u'E', u'F', u'G', u'H', u'I', u'J', u'K',
    u'L', u'M', u'N', u'O', u'P', u'Q', u'R', u'S', u'T', u'U', u'V',
    u'W', u'X', u'Y', u'Z',
    u'!', u'"', u'#', u'$', u'%', u'&', u'\'', u'(', u')', u'*', u'+',
    u',', u'-', u'.', u'/', u':', u';', u'<', u'=', u'>', u'?', u'@',
    u'[', u"¥", u']', u'^', u'_', u'`', u'{', u'|', u'}', u'~', u' '
)

KANA_ZENKAKU_CHARS = (
    u'ア', u'イ', u'ウ', u'エ', u'オ', u'カ', u'キ', u'ク', u'ケ', u'コ',
    u'サ', u'シ', u'ス', u'セ', u'ソ', u'タ', u'チ', u'ツ', u'テ', u'ト',
    u'ナ', u'ニ', u'ヌ', u'ネ', u'ノ', u'ハ', u'ヒ', u'フ', u'ヘ', u'ホ',
    u'マ', u'ミ', u'ム', u'メ', u'モ', u'ヤ', u'ユ', u'ヨ',
    u'ラ', u'リ', u'ル', u'レ', u'ロ', u'ワ', u'ヲ', u'ン',
    u'ァ', u'ィ', u'ゥ', u'ェ', u'ォ', u'ッ', u'ャ', u'ュ', u'ョ',
    u'。', u'、', u'・', u'゛', u'゜', u'「', u'」', u'ー'
)

KANA_HANKAKU_CHARS = (
    u'ｱ', u'ｲ', u'ｳ', u'ｴ', u'ｵ', u'ｶ', u'ｷ', u'ｸ', u'ｹ', u'ｺ',
    u'ｻ', u'ｼ', u'ｽ', u'ｾ', u'ｿ', u'ﾀ', u'ﾁ', u'ﾂ', u'ﾃ', u'ﾄ',
    u'ﾅ', u'ﾆ', u'ﾇ', u'ﾈ', u'ﾉ', u'ﾊ', u'ﾋ', u'ﾌ', u'ﾍ', u'ﾎ',
    u'ﾏ', u'ﾐ', u'ﾑ', u'ﾒ', u'ﾓ', u'ﾔ', u'ﾕ', u'ﾖ',
    u'ﾗ', u'ﾘ', u'ﾙ', u'ﾚ', u'ﾛ', u'ﾜ', u'ｦ', u'ﾝ',
    u'ｧ', u'ｨ', u'ｩ', u'ｪ', u'ｫ', u'ｯ', u'ｬ', u'ｭ', u'ｮ',
    u'｡', u'､', u'･', u'ﾞ', u'ﾟ', u'｢', u'｣', u'ｰ'
)

DIGIT_ZENKAKU_CHARS = (
    u'０', u'１', u'２', u'３', u'４', u'５', u'６', u'７', u'８', u'９'
)

DIGIT_HANKAKU_CHARS = (
    u'0', u'1', u'2', u'3', u'4', u'5', u'6', u'7', u'8', u'9'
)

KANA_TEN_MAP = (
    (u'ガ', u'ｶ'), (u'ギ', u'ｷ'), (u'グ', u'ｸ'), (u'ゲ', u'ｹ'), (u'ゴ', u'ｺ'),
    (u'ザ', u'ｻ'), (u'ジ', u'ｼ'), (u'ズ', u'ｽ'), (u'ゼ', u'ｾ'), (u'ゾ', u'ｿ'),
    (u'ダ', u'ﾀ'), (u'ヂ', u'ﾁ'), (u'ヅ', u'ﾂ'), (u'デ', u'ﾃ'), (u'ド', u'ﾄ'),
    (u'バ', u'ﾊ'), (u'ビ', u'ﾋ'), (u'ブ', u'ﾌ'), (u'ベ', u'ﾍ'), (u'ボ', u'ﾎ'),
    (u'ヴ', u'ｳ')
)

KANA_MARU_MAP = (
    (u'パ', u'ﾊ'), (u'ピ', u'ﾋ'), (u'プ', u'ﾌ'), (u'ペ', u'ﾍ'), (u'ポ', u'ﾎ')
)

cdef table_type ascii_zh_table, ascii_hz_table

for (z, h) in zip(ASCII_ZENKAKU_CHARS, ASCII_HANKAKU_CHARS):
    ascii_zh_table[z] = h
    ascii_hz_table[h] = z

cdef table_type kana_zh_table, kana_hz_table

for (z, h) in zip(KANA_ZENKAKU_CHARS, KANA_HANKAKU_CHARS):
    kana_zh_table[z] = h
    kana_hz_table[h] = z

cdef table_type digit_zh_table, digit_hz_table

for (z, h) in zip(DIGIT_ZENKAKU_CHARS, DIGIT_HANKAKU_CHARS):
    digit_zh_table[z] = h
    digit_hz_table[h] = z

cdef table_type kana_ten_zh_table, kana_ten_hz_table

for (z, h) in KANA_TEN_MAP:
    kana_ten_zh_table[z] = h
    kana_ten_hz_table[h] = z

cdef table_type kana_maru_zh_table, kana_maru_hz_table

for (z, h) in KANA_MARU_MAP:
    kana_maru_zh_table[z] = h
    kana_maru_hz_table[h] = z

del ASCII_HANKAKU_CHARS, ASCII_ZENKAKU_CHARS,\
    KANA_HANKAKU_CHARS, KANA_ZENKAKU_CHARS,\
    DIGIT_HANKAKU_CHARS, DIGIT_ZENKAKU_CHARS,\
    KANA_TEN_MAP, KANA_MARU_MAP


cpdef unicode zen_to_han(unicode text, bint ascii=True, bint digit=True,
                         bint kana=True):

    cdef Py_UNICODE *buf = <Py_UNICODE *>malloc(sizeof(Py_UNICODE) * (len(text) * 2 + 1))

    cdef Py_UNICODE c
    cdef int pos = 0

    for c in text:
        if ascii and ascii_zh_table.count(c):
            buf[pos] = ascii_zh_table[c]

        elif digit and digit_zh_table.count(c):
            buf[pos] = digit_zh_table[c]

        elif kana and kana_zh_table.count(c):
            buf[pos] = kana_zh_table[c]

        elif kana and kana_ten_zh_table.count(c):
            buf[pos] = kana_ten_zh_table[c]
            pos += 1
            buf[pos] = u'ﾞ'

        elif kana and kana_maru_zh_table.count(c):
            buf[pos] = kana_maru_zh_table[c]
            pos += 1
            buf[pos] = u'ﾟ'

        else:
            buf[pos] = c

        pos += 1

    buf[pos] = u'\0'

    cdef unicode ret = buf

    free(buf)

    return ret


cpdef unicode han_to_zen(unicode text, bint ascii=True, bint digit=True,
                         bint kana=True):

    cdef Py_UNICODE *buf = <Py_UNICODE *>malloc(sizeof(Py_UNICODE) * (len(text) + 1))

    cdef Py_UNICODE c, prev
    cdef int pos = 0

    for c in text:
        if ascii and ascii_hz_table.count(c):
            buf[pos] = ascii_hz_table[c]

        elif digit and digit_hz_table.count(c):
            buf[pos] = digit_hz_table[c]

        elif kana and c == u'ﾞ' and kana_ten_hz_table.count(prev):
            pos -= 1
            buf[pos] = kana_ten_hz_table[prev]

        elif kana and c == u'ﾟ' and kana_maru_hz_table.count(prev):
            pos -= 1
            buf[pos] = kana_maru_hz_table[prev]

        elif kana and kana_hz_table.count(c):
            buf[pos] = kana_hz_table[c]

        else:
            buf[pos] = c

        prev = c
        pos += 1

    buf[pos] = u'\0'

    cdef unicode ret = buf

    free(buf)

    return ret
