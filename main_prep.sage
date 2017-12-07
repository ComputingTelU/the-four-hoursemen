from preparation import preparation

f = open('preparation', 'w')

R = {
    3: range(3,10+1)+range(14,21+1),
    5: range(3,6+1)+range(10,21+1),
    7: range(3,5+1)+range(9,21+1),
}
for q, r in R.iteritems():
    for n in r:
        M, v = preparation(n, q)
        f.write('q = ')
        f.write(str(q))
        f.write('\n')

        f.write('n = ')
        f.write(str(n))
        f.write('\n')

        f.write('M = ')
        f.write(str(
            [
                list(m) for m in M
            ]
        ))
        f.write('\n')

        f.write('v = ')
        f.write(str(list(v[0])))
        f.write('\n')

        f.write('\n')
f.write('---------------------'+'\n')

f.close()
