def upflow_broadcast(r, M, v):
    # print "############ Upflow Broadcast #################"

    # show("############# Private Key Generation #############")
    # show("Banyak pihak yang terlibat : ", r)
    A=[]
    alpha=[abs(ZZ.random_element()) for i in range(r)]    #Generate alpha i
    # show("List nilai alpha : ", alpha)

    for i in range(r):                                     #Lakukan perulangan sebanyak r pihak yang terlibat
        A.append(M**alpha[i])                             #Insert private matriks generation ke dalam list Ai
    # show("List private matriks A = ", A)

    # html('<!--notruncate-->') #Menghindari error output
    # show("############# Upflow #############")
    N=r #Jumlah pratisipan
    U=[]

    for i in range(N-1):
        if i==0:
            U.append(v*A[0])    #P1 Construct U1
            # show("U1 : ", U)
        elif i==1:
            U = [U[0]*A[1], U[0], v*A[1]] #P2 Constucts U2
            # show("U2 : ", U)
        else:
            copyU = list(U)
            copyU[1]=U[0]
            copyU[0]=U[0]*A[i]
            for j in range(2, len(U)):
                copyU[j]=U[j-1]*A[i]
            copyU.append(U[-1]*A[i])
            U=copyU
            # show("U",j+1," : ", U)

    # show("############# Broadcast #############")
    [U[i]*A[-1] for i in range(1, N-1)] #PN Constructs Broadcast Message
    # show("P",N, " constructs Broadcast : ", U[1:])
    for i in range(N-1,-1,-1):
        if i==N-1:
            pass #do something
            # show("Key for P", i+1, " : ", U.pop(0))
        else:
            pass #do something
            # show("Key for P",i+1, " : ", U.pop(0)*A[i])
