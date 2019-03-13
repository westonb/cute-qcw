import pickle 
import matplotlib.pyplot as plt

with open('waves.pkl', 'rb') as f:
	time, current, voltage, period = pickle.load(f)

plt.figure()
plt.plot(time, voltage, time, current)
plt.figure()
plt.plot(time, period)
plt.show()