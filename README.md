# the-four-hoursemen
Examination of Extended Megreleshvili Protocol for Multi Party Key Exchange

## How to use
1. Open terminal.
2. From root directory, type command `sage`.
3. Make sure everything is fine.
4. Set value for variable:
    - `v`  : public vector Matrix in `gf(q)``
    - `M`  : public matrix Matrix() in `gf(q)`
    - `r`  : natural integer [3,..) example: `r=10`
5. If you don't have `M` and `v` for the key exchange code yet, run preparation code by typing in command `load("preparation.sage")`.
6. Load the algorithm using `load("<key_exchange_code_sage>.sage")`.
7. Test your algorithm `%timeit <key_exchange_code_sage>(r, M, v)`

## Notes
1. In using `timeit` magic command, please refer to this link (https://ipython.org/ipython-doc/dev/interactive/magics.html#magic-timeit)
2. `M` and `v` could be generated using `load("preparation.sage")` or you could set the value by hand.
3. Please refer to `preparation.sage` to identify `M` and `v` 's type.
