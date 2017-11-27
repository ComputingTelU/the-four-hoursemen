if __name__ == '__main__':

    import ast

    file_list = [
        'data/Exper-Data-GF2.txt',
        'data/Exper-Data-GF3.txt',
        'data/Exper-Data-GF5.txt',
        'data/Exper-Data-GF7.txt'
    ]

    data = {}

    q = 0
    n = 0
    for file in file_list:
        f = open(file, 'r')
        for line in f:
            if line[0] == 'q':
                q = int(line[4:])
                if q not in data:
                    data[q] = {}
                continue
            if line[0] == 'n':
                n = int(line[4:])
                data[q][n] = {}
                continue
            if line[0] == 'M':
                data[q][n]['M'] = Matrix(ast.literal_eval(
                    line[4:]
                ))
                continue
            if line[0] == 'v':
                data[q][n]['v'] = Matrix(ast.literal_eval(
                    line[4:]
                ))
                continue

    print('Now you can call the "data" by using "data[q][n][\'M\']" or "data[q][n][\'v\']"')
