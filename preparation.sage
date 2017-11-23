"""
MAKE SURE YOU ALREADY SET
n
gf
r
IN YOUR SHELL
"""


from itertools import product           #Untuk melakukan Permutasi
from random import shuffle              #Untuk melakukan Shuffle pada list

def primitive_polynom(n, gf):           #Mencari Primitive Polynomial di Finite Field GF=gf dengan pangkat terbesar n
    F=[]
    F2=[]
    list_poly=[item for item in list(product([i for i in range(0, gf)], repeat=n+1)) if item[n]==1]
    #Melakukan permutasi dengan hasil berbentuk list dan angka ke n=1 untuk memastikan koefisien pangkat terbesar 1
    R.<x>=PolynomialRing(QQ)            #Converter ke Polynomial
    for elmnt in list_poly:
        F.append(R(elmnt))              #Mengubah list ke dalam bentuk polynomial
    R.<x>=GF(gf)['x']                   #Converter ke Galois  Field
    for elmnt in F:
        if(R(elmnt).is_primitive()):    #Cek apakah element pada F primitive? Dengan mengubah element ke GF
            F2.append(R(elmnt))         #Mengumpulkan primitive polynomial
    return F2

"""
def orderOfP(P, n, gf):                 #Mencari order P dengan ukuran n*n di GF=gf
    order=1
    check=P
    while(check!=matrix^n-1):
        check*=p
        order+=1
    return order
"""
def generateC(n, a, gf):                #Membuat Companion Matrix C dengan ukuran n*n yang memiliki primitive polymonial a di GF=gf
    if (n==1):
        return [[1]]
    else:
        C=[[0 for i in range(n)] for j in range(n)]
        for i in range(n):
            for j in range(n):
                if((i-j)==1):
                    C[i][j]=1
                elif(j==(n-1)):
                    y=a[i]
                    C[i][j]=-a[i]
                else:
                    C[i][j]=0
    return C
def generateV(n, gf):                   #Membuat vektor non-zero dengan panjang n atas GF(gf)
    v=[0 for i in range(n)]
    while(v==[0 for i in range(n)]):
        v=[ZZ.random_element()%gf for i in range(n)]
    return v
def generateQ(n, gf):                   #Membuat matrix Q dengan ukuran n*n di GF=gf
    Q=[[0 for i in range(n)] for j in range(n)]     #Inisialisasi matrix
    for i in range(n):
        for j in range(n):
            if(i==j):
                Q[i][j]=ZZ.random_element(1, gf)    #Melakukan random integer dari 1 sampai gf-1
            elif(j>i):
                Q[i][j]=ZZ.random_element(0, gf)    #Melakukan random integer dari 0 sampai gf-1
    shuffle(Q)                                      #Melakukan pengacakan baris
    m=matrix(Q)
    m=m.transpose()
    Q=list(m)
    shuffle(Q)                                      #Melakukan pengacakan kolom
    m=matrix(Q)
    m=m.transpose()
    Q=list(m)
    return Q

def preparation(n, gf, r):
    ########### Generate Companion Matrix ###########

    gen_primitive=primitive_polynom(n, gf)
    f=gen_primitive[ZZ.random_element()%len(gen_primitive)]
    primitive=Sequence(f.coefficients(sparse=False))
    # print "Primitive f(x) = ", f

    F=GF(gf)
    M=MatrixSpace(F, n, n)
    N=MatrixSpace(F, 1, n)
    P_tmp=M(generateC(n, primitive, gf))
    # show("C = ", P_tmp)

    ################## Generate  Q ##################
    Q=M(generateQ(n, gf))
    # show("Q = ", Q)
    # show("~Q = ", ~Q)
    #print Q.is_invertible()

    ########### Public Parameter Creation ###########
    M=Q*P_tmp*(~Q)                                      #Matriks
    # print "M"
    # print M
    # print

    v=N(generateV(n, gf))                               #Vektor v publik
    # print "v"
    # print v
    # print

    return (M, v)
