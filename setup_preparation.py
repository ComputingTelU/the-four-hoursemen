# SETUP PREPARATION
# Setup Preparation for future simulation
#

# Primitive Polynom function


# Generate C function
#membuat companion matrix c dgn ukuran n*n yg memiliki primitive polynomial a di GF=gf
def generateC(n, a, gf):
	if (n == 1):
		return [[1]]
	else:
		C = [[0 for i in range(n)] for j in range(n)]
		for i in range(n):
			for j in range(n):
				print 'i: %d, j: %d' %(i, j)
				if ((i-j)==1):
					C[i][j] = 1
				elif (j == (n-1)):
					y = a[i]
					C[i][j] =- a[i]
				else: 
					C[i][j] = 0
	return C

#a = [[x^2 + x + 2], [x^2 + 4x + 2], [x^2 + 2x + 3], [x^2 + 3x + 3]]
a = [3, 6, 4, 5]
print generateC(3, a, 0)

# Generate V function
import random, sys
from numpy import matrix

def generate_v(n, gf):
	v = [0 for i in range(n)]
	while (v == [0 for i in range(n)]):
		v = [random.randrange(sys.maxint)%gf for i in range(n)]
	return v

# Generate Q function


