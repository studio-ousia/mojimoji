# -*- coding: utf-8 -*-

import mojimoji

from nose.tools import *


def test_zen_to_han():
    eq_(u'ｱｲｳｴｵ', mojimoji.zen_to_han(u'アイウエオ'))
    eq_(u'ｶﾞｷﾞｸﾞｹﾞｺﾞ', mojimoji.zen_to_han(u'ガギグゲゴ'))
    eq_(u'ﾊﾟﾋﾟﾌﾟﾍﾟﾎﾟ', mojimoji.zen_to_han(u'パピプペポ'))
    eq_(u'0123', mojimoji.zen_to_han(u'０１２３'))
    eq_(u'abcABC', mojimoji.zen_to_han(u'ａｂｃＡＢＣ'))
    eq_(u'#?!', mojimoji.zen_to_han(u'＃？！'))
    eq_(u'あいうえお', mojimoji.zen_to_han(u'あいうえお'))


def test_han_to_zen():
    eq_(u'アイウエオ', mojimoji.han_to_zen(u'ｱｲｳｴｵ'))
    eq_(u'ガギグゲゴ', mojimoji.han_to_zen(u'ｶﾞｷﾞｸﾞｹﾞｺﾞ'))
    eq_(u'パピプペポ', mojimoji.han_to_zen(u'ﾊﾟﾋﾟﾌﾟﾍﾟﾎﾟ'))
    eq_(u'０１２３', mojimoji.han_to_zen(u'0123'))
    eq_(u'ａｂｃＡＢＣ', mojimoji.han_to_zen(u'abcABC'))
    eq_(u'＃？！', mojimoji.han_to_zen(u'#?!'))
    eq_(u'あいうえお', mojimoji.han_to_zen(u'あいうえお'))
