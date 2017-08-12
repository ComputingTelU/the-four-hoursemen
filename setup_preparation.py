# SETUP PREPARATION
# Setup Preparation for future simulation
#

# Primitive Polynom function


# Generate C function


# Generate V function
import random, sys
from numpy import matrix

def generate_v(n, gf):
	v = [0 for i in range(n)]
	while (v == [0 for i in range(n)]):
		v = [random.randrange(sys.maxint)%gf for i in range(n)]
	return v

# Generate Q function


