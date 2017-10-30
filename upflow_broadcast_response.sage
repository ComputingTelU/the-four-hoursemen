"""
MAKE SURE YOU ALREADY SET
n
gf
r
IN YOUR SHELL
"""

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
N=r #Jumlah pratisipan
U=[]

# show("############# Upflow #############")
#Pi calculates and sends the value to Pi+1. for i=1,2,..N-1
for i in range(N-1):
    if i==0:
        U.append(v*A[i])
        # show("U",i+1," : ", U[i])
    else:
        U.append(U[-1]*A[i])
        # show("U",i+1," : ", U[i])
    if i==N-2:
        #Broadcast
        U.append(U[-1]) #Pn gets from Pn-1
        for j in range(N-2):
            U[j]=U[N-2] #Pn-1 broadcasts to P1,..,Pn-2

# show("############# Broadcast #############")
for i in range(N):
    pass #do something
    # show("U",i+1," : ", U[i])

# show("############# Response #############")
R = []
for i in range(N-1):
    R.append(U[i]*A[i].inverse())
# show("Response List: ")
# show("R = ", R)

B = []
for i in range(N-1):
    B.append(R[i]*A[-1])
# show("Broadcast List: ")
# show("B = ", B)

# show("############# Key Retreival #############")
for i in range(N-1):
    pass #do something
    # show("Key for P",i+1," : ",B[i]*A[i])
# show("Key for P",N," : ",U[-1]*A[-1])
