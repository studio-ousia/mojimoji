mojimoji
========

.. image:: https://badge.fury.io/py/mojimoji.png
    :target: http://badge.fury.io/py/mojimoji

.. image:: https://travis-ci.org/studio-ousia/mojimoji.png?branch=master
    :target: https://travis-ci.org/studio-ousia/mojimoji

A lightweight converter between hankaku(half-width) and zenkaku(full-width) characters.

Installation
------------

.. code-block:: bash

    $ pip install mojimoji

Examples
--------

Zenkaku to Hankaku
^^^^^^^^^^^^^^^^^^

.. code-block:: python

    >>> import mojimoji
    >>> print mojimoji.zen_to_han(u'アイウａｂｃ０１２')
    ｱｲｳabc012
    >>> print mojimoji.zen_to_han(u'アイウａｂｃ０１２', kana=False)
    アイウabc012
    >>> print mojimoji.zen_to_han(u'アイウａｂｃ０１２', digit=False)
    ｱｲｳabc０１２
    >>> print mojimoji.zen_to_han(u'アイウａｂｃ０１２', ascii=False)
    ｱｲｳａｂｃ012

Hankaku to Zenkaku
^^^^^^^^^^^^^^^^^^

.. code-block:: python

    >>> import mojimoji
    >>> print mojimoji.han_to_zen(u'ｱｲｳabc012')
    アイウａｂｃ０１２
    >>> print mojimoji.han_to_zen(u'ｱｲｳabc012', kana=False)
    ｱｲｳａｂｃ０１２
    >>> print mojimoji.han_to_zen(u'ｱｲｳabc012', digit=False)
    アイウａｂｃ012
    >>> print mojimoji.han_to_zen(u'ｱｲｳabc012', ascii=False)
    アイウabc０１２


Benchmarks
----------

Library versions
^^^^^^^^^^^^^^^^

- mojimoji: 0.0.1
- `zenhan <https://pypi.python.org/pypi/zenhan>`_: 0.4
- `unicodedata <http://docs.python.org/2/library/unicodedata.html>`_: Bundled with Python 2.7.3

Results
^^^^^^^

.. code-block:: python

    In [19]: s = u'ＡＢＣＤＥＦＧ０１２３４５' * 10

    In [20]: %time for n in range(1000000): mojimoji.zen_to_han(s)
    CPU times: user 2.86 s, sys: 0.10 s, total: 2.97 s
    Wall time: 2.88 s

    In [21]: %time for n in range(1000000): unicodedata.normalize('NFKC', s)
    CPU times: user 5.43 s, sys: 0.12 s, total: 5.55 s
    Wall time: 5.44 s

    In [22]: %time for n in range(1000000): zenhan.z2h(s)
    CPU times: user 69.18 s, sys: 0.11 s, total: 69.29 s
    Wall time: 69.48 s
