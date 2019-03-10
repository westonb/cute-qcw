#python3
from scipy import signal
import matplotlib.pyplot as plt
import numpy as np
import math
import control

#parameters
Rp = 1.0
Cp = 10E-9
Lp = 15.8E-6

K = 0.4

Rs = 100.0
Ls = 14E-3
Cs = 7.6E-12

Lm = K * math.sqrt(Lp*Ls)

#three branches, Z1, Z2, Z3

Branch1 = control.TransferFunction([Cp*(Lp-Lm), Cp*Rp, 1], [Cp, 0])
Branch2 = control.TransferFunction([Cs*(Ls-Lm), Cs*Rs, 1], [Cs, 0])
Branch3 = control.TransferFunction([Lm, 0], [1])

BranchParallel = ((Branch3**-1) + Branch2**-1)**-1

System = (BranchParallel + Branch1)**-1
sys = System.returnScipySignalLTI()[0][0]


#coeffs in decending order
w, mag, phase = sys.bode(np.linspace(math.pi*2*50E3, math.pi*2*800E3, 10000))


plt.figure()
plt.semilogx(w, mag)    # Bode magnitude plot
plt.figure()
plt.semilogx(w, phase)  # Bode phase plot
plt.show()