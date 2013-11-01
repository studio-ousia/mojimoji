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

    $ pip install Cython
    $ pip install mojimoji

Examples
--------

Hankaku to Zenkaku
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

Zenkaku to Hankaku
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
