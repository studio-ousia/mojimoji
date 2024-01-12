# cython: language_level=3
# distutils: language=c++

import cython
from cython.cimports.cpython.unicode import PyUnicode_FromKindAndData, PyUnicode_4BYTE_KIND
from cython.cimports.libc.stdlib import free, malloc
from cython.cimports.libcpp.unordered_map import unordered_map


_ASCII_ZENKAKU_CHARS = (
    "ａ",
    "ｂ",
    "ｃ",
    "ｄ",
    "ｅ",
    "ｆ",
    "ｇ",
    "ｈ",
    "ｉ",
    "ｊ",
    "ｋ",
    "ｌ",
    "ｍ",
    "ｎ",
    "ｏ",
    "ｐ",
    "ｑ",
    "ｒ",
    "ｓ",
    "ｔ",
    "ｕ",
    "ｖ",
    "ｗ",
    "ｘ",
    "ｙ",
    "ｚ",
    "Ａ",
    "Ｂ",
    "Ｃ",
    "Ｄ",
    "Ｅ",
    "Ｆ",
    "Ｇ",
    "Ｈ",
    "Ｉ",
    "Ｊ",
    "Ｋ",
    "Ｌ",
    "Ｍ",
    "Ｎ",
    "Ｏ",
    "Ｐ",
    "Ｑ",
    "Ｒ",
    "Ｓ",
    "Ｔ",
    "Ｕ",
    "Ｖ",
    "Ｗ",
    "Ｘ",
    "Ｙ",
    "Ｚ",
    "！",
    "”",
    "＃",
    "＄",
    "％",
    "＆",
    "’",
    "（",
    "）",
    "＊",
    "＋",
    "，",
    "－",
    "．",
    "／",
    "：",
    "；",
    "＜",
    "＝",
    "＞",
    "？",
    "＠",
    "［",
    "￥",
    "］",
    "＾",
    "＿",
    "‘",
    "｛",
    "｜",
    "｝",
    "～",
    "　",
    "＼",
)

_ASCII_HANKAKU_CHARS = (
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "!",
    '"',
    "#",
    "$",
    "%",
    "&",
    "'",
    "(",
    ")",
    "*",
    "+",
    ",",
    "-",
    ".",
    "/",
    ":",
    ";",
    "<",
    "=",
    ">",
    "?",
    "@",
    "[",
    "¥",
    "]",
    "^",
    "_",
    "`",
    "{",
    "|",
    "}",
    "~",
    " ",
    "\\",
)

_KANA_ZENKAKU_CHARS = (
    "ア",
    "イ",
    "ウ",
    "エ",
    "オ",
    "カ",
    "キ",
    "ク",
    "ケ",
    "コ",
    "サ",
    "シ",
    "ス",
    "セ",
    "ソ",
    "タ",
    "チ",
    "ツ",
    "テ",
    "ト",
    "ナ",
    "ニ",
    "ヌ",
    "ネ",
    "ノ",
    "ハ",
    "ヒ",
    "フ",
    "ヘ",
    "ホ",
    "マ",
    "ミ",
    "ム",
    "メ",
    "モ",
    "ヤ",
    "ユ",
    "ヨ",
    "ラ",
    "リ",
    "ル",
    "レ",
    "ロ",
    "ワ",
    "ヲ",
    "ン",
    "ァ",
    "ィ",
    "ゥ",
    "ェ",
    "ォ",
    "ッ",
    "ャ",
    "ュ",
    "ョ",
    "。",
    "、",
    "・",
    "゛",
    "゜",
    "「",
    "」",
    "ー",
)

_KANA_HANKAKU_CHARS = (
    "ｱ",
    "ｲ",
    "ｳ",
    "ｴ",
    "ｵ",
    "ｶ",
    "ｷ",
    "ｸ",
    "ｹ",
    "ｺ",
    "ｻ",
    "ｼ",
    "ｽ",
    "ｾ",
    "ｿ",
    "ﾀ",
    "ﾁ",
    "ﾂ",
    "ﾃ",
    "ﾄ",
    "ﾅ",
    "ﾆ",
    "ﾇ",
    "ﾈ",
    "ﾉ",
    "ﾊ",
    "ﾋ",
    "ﾌ",
    "ﾍ",
    "ﾎ",
    "ﾏ",
    "ﾐ",
    "ﾑ",
    "ﾒ",
    "ﾓ",
    "ﾔ",
    "ﾕ",
    "ﾖ",
    "ﾗ",
    "ﾘ",
    "ﾙ",
    "ﾚ",
    "ﾛ",
    "ﾜ",
    "ｦ",
    "ﾝ",
    "ｧ",
    "ｨ",
    "ｩ",
    "ｪ",
    "ｫ",
    "ｯ",
    "ｬ",
    "ｭ",
    "ｮ",
    "｡",
    "､",
    "･",
    "ﾞ",
    "ﾟ",
    "｢",
    "｣",
    "ｰ",
)

_DIGIT_ZENKAKU_CHARS = ("０", "１", "２", "３", "４", "５", "６", "７", "８", "９")

_DIGIT_HANKAKU_CHARS = ("0", "1", "2", "3", "4", "5", "6", "7", "8", "9")

_KANA_TEN_MAP = (
    ("ガ", "ｶ"),
    ("ギ", "ｷ"),
    ("グ", "ｸ"),
    ("ゲ", "ｹ"),
    ("ゴ", "ｺ"),
    ("ザ", "ｻ"),
    ("ジ", "ｼ"),
    ("ズ", "ｽ"),
    ("ゼ", "ｾ"),
    ("ゾ", "ｿ"),
    ("ダ", "ﾀ"),
    ("ヂ", "ﾁ"),
    ("ヅ", "ﾂ"),
    ("デ", "ﾃ"),
    ("ド", "ﾄ"),
    ("バ", "ﾊ"),
    ("ビ", "ﾋ"),
    ("ブ", "ﾌ"),
    ("ベ", "ﾍ"),
    ("ボ", "ﾎ"),
    ("ヴ", "ｳ"),
)

_KANA_MARU_MAP = (("パ", "ﾊ"), ("ピ", "ﾋ"), ("プ", "ﾌ"), ("ペ", "ﾍ"), ("ポ", "ﾎ"))

char_table = cython.typedef(unordered_map[cython.Py_UCS4, cython.Py_UCS4])

ascii_zh_table = cython.declare(char_table)
ascii_hz_table = cython.declare(char_table)
for z, h in zip(_ASCII_ZENKAKU_CHARS, _ASCII_HANKAKU_CHARS):
    ascii_zh_table[z] = h
    ascii_hz_table[h] = z

kana_zh_table = cython.declare(char_table)
kana_hz_table = cython.declare(char_table)

for z, h in zip(_KANA_ZENKAKU_CHARS, _KANA_HANKAKU_CHARS):
    kana_zh_table[z] = h
    kana_hz_table[h] = z

digit_zh_table = cython.declare(char_table)
digit_hz_table = cython.declare(char_table)

for z, h in zip(_DIGIT_ZENKAKU_CHARS, _DIGIT_HANKAKU_CHARS):
    digit_zh_table[z] = h
    digit_hz_table[h] = z

kana_ten_zh_table = cython.declare(char_table)
kana_ten_hz_table = cython.declare(char_table)

for z, h in _KANA_TEN_MAP:
    kana_ten_zh_table[z] = h
    kana_ten_hz_table[h] = z

kana_maru_zh_table = cython.declare(char_table)
kana_maru_hz_table = cython.declare(char_table)

for z, h in _KANA_MARU_MAP:
    kana_maru_zh_table[z] = h
    kana_maru_hz_table[h] = z

del (
    _ASCII_HANKAKU_CHARS,
    _ASCII_ZENKAKU_CHARS,
    _KANA_HANKAKU_CHARS,
    _KANA_ZENKAKU_CHARS,
    _DIGIT_HANKAKU_CHARS,
    _DIGIT_ZENKAKU_CHARS,
    _KANA_TEN_MAP,
    _KANA_MARU_MAP,
)


@cython.ccall
@cython.returns(str)
@cython.locals(c=cython.Py_UCS4, buf=cython.p_Py_UCS4, pos=cython.int, ret=str)
def zen_to_han(text: str, ascii: cython.bint = True, digit: cython.bint = True, kana: cython.bint = True):
    buf = cython.cast(cython.p_Py_UCS4, malloc(cython.sizeof(cython.Py_UCS4) * len(text) * 2))
    pos = 0
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
            buf[pos] = "ﾞ"
        elif kana and kana_maru_zh_table.count(c):
            buf[pos] = kana_maru_zh_table[c]
            pos += 1
            buf[pos] = "ﾟ"
        else:
            buf[pos] = c

        pos += 1

    ret = PyUnicode_FromKindAndData(PyUnicode_4BYTE_KIND, buf, pos)
    free(buf)
    return ret


@cython.ccall
@cython.returns(str)
@cython.locals(c=cython.Py_UCS4, prev=cython.Py_UCS4, buf=cython.p_Py_UCS4, pos=cython.int, ret=str)
def han_to_zen(text: str, ascii: cython.bint = True, digit: cython.bint = True, kana: cython.bint = True):
    buf = cython.cast(cython.p_Py_UCS4, malloc(cython.sizeof(cython.Py_UCS4) * len(text)))
    pos = 0
    prev = " "

    for c in text:
        if ascii and ascii_hz_table.count(c):
            buf[pos] = ascii_hz_table[c]
        elif digit and digit_hz_table.count(c):
            buf[pos] = digit_hz_table[c]
        elif kana and c == "ﾞ" and kana_ten_hz_table.count(prev):
            pos -= 1
            buf[pos] = kana_ten_hz_table[prev]
        elif kana and c == "ﾟ" and kana_maru_hz_table.count(prev):
            pos -= 1
            buf[pos] = kana_maru_hz_table[prev]
        elif kana and kana_hz_table.count(c):
            buf[pos] = kana_hz_table[c]
        else:
            buf[pos] = c

        prev = c
        pos += 1

    ret = PyUnicode_FromKindAndData(PyUnicode_4BYTE_KIND, buf, pos)
    free(buf)
    return ret
