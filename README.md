# the-four-hoursemen
Examination of Extended Megrelesihvili Protocol for Multi Party Key Exchange

## How to use
1. Open terminal.
2. From root directory, type command `sage`.
3. Make sure everything is fine.
4. Set value for variable:
    - `n`  : natural integer [3,..) example: `n=3`
    - `gf` : prime integer (2,..) example: `gf=7`
    - `r`  : natural integer [3,..) example: `r=10`
5. If you don't have `M` and `v` for the key exchange code yet, run preparation code by typing in command `load("preparation.sage")`.
6. Now you could run the key exchange code by using command `%timeit load("<key_exchange_code_nage>.sage")`.

## Notes
1. In using `timeit` magic command, please refer to this link (https://ipython.org/ipython-doc/dev/interactive/magics.html#magic-timeit)
2. Before you run the key exchange code, make sure you have set the value for `n`, `gf`, `r`, `M`, `v`.
3. `M` and `v` could be generated using `load("preparation.sage")` or you could set the value by hand.
Please refer to `preparation.sage` to identify `M` and `v` 's type.
