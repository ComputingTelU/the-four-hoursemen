def circular(r, M, v):
    print("################### Circular ####################")

    show("############# Private Key Generation #############")
    show("Banyak pihak yang terlibat : ", r)
    A=[]
    alpha=[abs(ZZ.random_element()) for i in range(r)]    #Generate alpha i
    show("List nilai alpha : ", alpha)

    for i in range(r):                                     #Lakukan perulangan sebanyak r pihak yang terlibat
        A.append(M**alpha[i])                             #Insert private matriks generation ke dalam list Ai
    show("List private matriks A = ", A)

    a=[[0 for j in range(r)] for i in range(r)]           #Inisialisasi list vektor orang ke i round ke j

    for i in range(r):                                      #Lakukan perulangan sebanyak r
        a[i][0]=v*A[i]                                      #Asign a orang ke i round ke 0 dengan v * A ke i

    show("Private Key Generation Putaran ke 0 ")
    for i in range(r):
        show("Pihak ke ", i+1, ": a",i,0," = ",a[i][0])

    for j in range(1, r):                                    #Lakukan perulangan dari j=1 hingga r
        for i in range(r):                                   #Lakukan perulangan sebanyak i=0 hingga r
            if i!=0:                                         #Jika i tidak menunjuk indeks pertama
                a[i][j]=a[i-1][j-1]*A[i]  #Asign a orang ke i putaran ke j dengan hasil kali a orang ke i-1 putaran ke j-1 dengan A ke i
            else:                                            #Jika i menunjuk indeks pertama
                a[i][j]=a[-1][j-1]*A[i] #Asign a orang ke i putaran ke j dengan hasil kali a orang terakhir putaran ke j-1 dengan A ke i


    """show("############ Public Exchange Value ############")
    for i in range(r):
        show("Pihak ke - ", i)
        for j in range(1,r):
            show("a",i,j," ",a[i][j])"""

    html('<!--notruncate-->') #Menghindari error output
    show("############ Public Exchange Value ############")
    """Menampilkan putaran ke j untuk setiap pihak i"""
    for j in range(1, r):
        show("Putaran ke ", j)
        for i in range(r):
            show("Pihak ke ", i+1, ": a",i,j," = ",a[i][j])
