def upflow_downflow(r, M, v):
    # print "############ Upflow Downflow ####################"

    # show("############# Private Key Generation #############")
    # show("Banyak pihak yang terlibat : ", r)
    A=[]
    alpha=[abs(ZZ.random_element()) for i in range(r)]    #Generate alpha i
    # show("List nilai alpha : ", alpha)

    for i in range(r):                                     #Lakukan perulangan sebanyak r pihak yang terlibat
        A.append(M**alpha[i])                             #Insert private matriks generation ke dalam list Ai
    # show("List private matriks A = ", A)

    # html('<!--notruncate-->') #Menghindari error output
    #Init
    N=r #Jumlah pratisipan
    U=[]

    # show("############# Upflow #############")
    for i in range(N):
        # show("P%s" %(i+1))
        if i == 0 :
            U.append(v*A[0])
            # show("Message sent to P%s: " %(i+2), U)
        elif i == N-1:
            # show("Message received from P%s: " %(i), U)
            U.insert(0, v)
        else:
            # show("Message received from P%s: " %(i), U)
            U.append(U[-1]*A[i])
            # show("Message sent to P%s: " %(i+2), U)

    # show("############# Downflow #############")
    for i in range(N-1, -1, -1):
        # show("P%s" %(i+1))
        if i == (N-1) :
            # show("Message Init : ", U)
            temp=U.pop()
            # show("Key = ", temp*A[i])
            U = [x*A[i] for x in U]
            # show("Message sent to P%s: " %(i), U)
        elif i == 0:
            # show("Message received from P%s: " %(i+2), U)
            temp=U.pop()
            # show("Key = ", temp*A[i])
        else:
            # show("Message received from P%s: " %(i+2), U)
            temp=U.pop()
            # show("Key = ", temp*A[i])
            U = [x*A[i] for x in U]
            # show("Message sent to P%s: " %(i), U)
