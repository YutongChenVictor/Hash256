import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge
from cocotb.types import LogicArray

@cocotb.test()
async def base_func_test(dut):

    dut.wr_rst_n = 0
    dut.rd_rst_n = 0

    cocotb.start_soon(wr_clock.start(start_high=False))
    cocotb.start_soon(rd_clock.start(start_high=False))
    await RisingEdge(dut.wr_clk)  # 等待写时钟的上升沿
    dut.wr_rst_n = 1
    await RisingEdge(dut.rd_clk)  # 等待写时钟的上升沿

    dut.rd_rst_n = 1
