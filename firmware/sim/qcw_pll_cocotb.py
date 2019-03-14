import cocotb
from cocotb.triggers import *
from cocotb.clock import Clock

from scipy import signal
import numpy as np
import math
import control
import pickle

time_steps = []
current_steps = []
voltage_steps = []
period_steps = []

#clock_period = 6250 #160 MHz clock
clock_period = 3120
simulation_time = 0.1E-4



@cocotb.test()
def feedback_test(dut):

    """
    Try accessing the design
    """
    dut._log.info("Running test!")

    dut.clk = 0
    dut.signal_in = 0
    dut.halt = 0
    dut.start = 0
    dut.phase_shift = 50
    dut.cycle_limit = 1000
    # "Clock" is a built in class for toggling a clock signal
    cocotb.fork(Clock(dut.clk, clock_period).start())
    yield ClockCycles(dut.clk, 2)


    cocotb.fork(monitor(dut))
    cocotb.fork(plant(dut))
    cocotb.fork(phase_shift(dut))

    yield ClockCycles(dut.clk, 2)


    dut.start = 1;

    #yield ClockCycles(dut.clk, 10E3)
    yield RisingEdge(dut.done)

    with open('waves.pkl', 'wb') as f:
        pickle.dump((time_steps, voltage_steps, current_steps, period_steps),f)

    dut._log.info("Exported Data")

@cocotb.coroutine
def monitor(dut):
    #init plant

    A_last = dut.out_A.value.integer
    B_last = dut.out_B.value.integer
    V_last = A_last - B_last

    while (1):
        yield [Edge(dut.out_A), Edge(dut.out_B)]
        A_new = dut.out_A.value.integer
        B_new = dut.out_B.value.integer
        V_new = A_new - B_new
        dut._log.info("Output Changed State!")
        dut._log.info("Last Voltage {}, New Voltage {}".format(V_last, V_new))
        outputVoltage = V_new
        A_last = A_new
        B_last = B_new 
        V_last = V_new

@cocotb.coroutine
def phase_shift(dut):
    #linear phase ramp going from 70 to 255 over 4000 cycles
    period_counter = 0.0
    dut.phase_shift = 100
    yield RisingEdge(dut.cycle_finished)
    yield RisingEdge(dut.cycle_finished)
    yield RisingEdge(dut.cycle_finished)
    yield RisingEdge(dut.cycle_finished)
    yield RisingEdge(dut.cycle_finished)
    yield RisingEdge(dut.cycle_finished)
    yield RisingEdge(dut.cycle_finished)
    yield RisingEdge(dut.cycle_finished)
    yield RisingEdge(dut.cycle_finished)
    yield RisingEdge(dut.cycle_finished)

    while (1):
        yield RisingEdge(dut.cycle_finished)
        period_counter = period_counter + 1
        dut.phase_shift = 100 + int((255.0-100.0)*period_counter/1000.0)







@cocotb.coroutine
def plant(dut):
    sys = init_system()
    voltage_last = 0
    voltage = 0

    T, yout, xout = signal.lsim(sys, [0, 0], [0, 1E-12*clock_period])
    cycle_counter = 0
    while (1):
        yield [Edge(dut.clk)]
        voltage_last = voltage
        voltage = (dut.out_A.value.integer - dut.out_B.value.integer)*1.0
        T, yout, xout = signal.lsim(sys, [voltage_last, voltage], [0, 1E-12*clock_period], xout[1])

        out_val = yout[1]

        if (out_val > 0):
            dut.signal_in = 1
        else:
            dut.signal_in = 0

        current_steps.append(out_val)
        voltage_steps.append(voltage)
        time_steps.append(cycle_counter*1E-12*clock_period)
        cycle_counter = cycle_counter + 1
        period_steps.append(dut.latched_period_value.value.integer)

def init_system():
    Qp = 400.0
    Cp = 10E-9
    Lp = 25.7E-6
    Rp = (1.0/Qp) * math.sqrt(Lp/Cp)

    K = 0.4

    Qs = 50.0
    Ls = 14E-3
    Cs = 15.8E-12
    Rs = 1.0/Qs * math.sqrt(Ls/Cs)

    Lm = K * math.sqrt(Lp*Ls)

    #three branches, Z1, Z2, Z3

    Branch1 = control.TransferFunction([Cp*(Lp-Lm), Cp*Rp, 1.0], [Cp, 0.0])
    Branch2 = control.TransferFunction([Cs*(Ls-Lm), Cs*Rs, 1.0], [Cs, 0.0])
    Branch3 = control.TransferFunction([Lm, 0.0], [1.0])

    BranchParallel = ((Branch3**-1) + Branch2**-1)**-1

    System = (BranchParallel + Branch1)**-1
    sys = System.returnScipySignalLTI()[0][0]

    return sys
