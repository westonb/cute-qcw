#python3
from scipy import signal
import matplotlib.pyplot as plt
import numpy as np
import math
import control

#parameters
Rp = 0.08
Cp = 10E-9
Lp = 25.7E-6

K = 0.4

Rs = 100.0
Ls = 14E-3
Cs = 15.8E-12

Lm = K * math.sqrt(Lp*Ls)

#three branches, Z1, Z2, Z3

Branch1 = control.TransferFunction([Cp*(Lp-Lm), Cp*Rp, 1], [Cp, 0])
Branch2 = control.TransferFunction([Cs*(Ls-Lm), Cs*Rs, 1], [Cs, 0])
Branch3 = control.TransferFunction([Lm, 0], [1])

BranchParallel = ((Branch3**-1) + Branch2**-1)**-1

System = (BranchParallel + Branch1)**-1
sys = System.returnScipySignalLTI()[0][0]


#step system
#out_vals = []
#T, yout, xout = signal.lsim(sys, [0, 1], [0, 1E-7])
#print((yout[0], yout[1]))
#out_vals.append(yout[1])
#for x in range(10000):
#	T, yout, xout = signal.lsim(sys, [1, 1], [0, 1E-7], xout[1])
#	out_vals.append(yout[1])

#stepT, stepY = signal.step(sys)

#coeffs in decending order
#w, mag, phase = sys.bode(np.linspace(math.pi*2*50E3, math.pi*2*800E3, 10000))

#square wave of system

#20 rf cycles
t = np.linspace(0, 50E-6, 2000)
square_wave = signal.square(t*2*np.pi*423E3)

T, yout, xout = signal.lsim(sys, square_wave, t);

w, mag, phase = sys.bode(np.linspace(math.pi*2*50E3, math.pi*2*800E3, 10000))
plt.figure()
plt.semilogx(w, mag)    # Bode magnitude plot
plt.figure()
plt.semilogx(w, phase)  # Bode phase plot
#plt.show()

plt.figure()
plt.plot(t, square_wave, T, yout)
plt.show()

