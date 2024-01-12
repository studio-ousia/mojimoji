import mojimoji
import pytest


@pytest.mark.parametrize(
    "expected,text",
    [
        ("ｱｲｳｴｵ", "アイウエオ"),
        ("ｶﾞｷﾞｸﾞｹﾞｺﾞ", "ガギグゲゴ"),
        ("ﾊﾟﾋﾟﾌﾟﾍﾟﾎﾟ", "パピプペポ"),
        ("0123", "０１２３"),
        ("abcABC", "ａｂｃＡＢＣ"),
        ("#?!¥\\", "＃？！￥＼"),
        ("あいうえお", "あいうえお"),
    ],
)
def test_zen_to_han(expected: str, text: str):
    assert mojimoji.zen_to_han(text) == expected


@pytest.mark.parametrize(
    "expected,text",
    [
        ("アイウエオ", "ｱｲｳｴｵ"),
        ("ガギグゲゴ", "ｶﾞｷﾞｸﾞｹﾞｺﾞ"),
        ("パピプペポ", "ﾊﾟﾋﾟﾌﾟﾍﾟﾎﾟ"),
        ("０１２３", "0123"),
        ("ａｂｃＡＢＣ", "abcABC"),
        ("＃？！￥＼", "#?!¥\\"),
        ("あいうえお", "あいうえお"),
        ("ア゛イ゛ヴエ゛オ゛", "ｱﾞｲﾞｳﾞｴﾞｵﾞ"),
    ],
)
def test_han_to_zen(expected: str, text: str):
    assert mojimoji.han_to_zen(text) == expected
