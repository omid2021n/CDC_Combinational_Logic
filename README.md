# CDC_Combinational_Logic

Key points in this version

comb_logic_A holds the combinational expression a & b | c.

sigA_reg is the clkA-domain registered version → removes glitches.

sync1 and sync2 are the two-flop synchronizer in clkB domain → handles metastability.

Output sigB is now safe to use in clkB domain.

Handling Clock Domain Crossing (CDC) in FPGA/ASIC Designs

In digital design, signals often need to move between different clock domains. Directly connecting them can cause metastability, glitches, or unpredictable behavior.

✅ How to safely synchronize signals across clock domains:

Single-bit control signals:

Register the signal in the source clock domain.

Use a two-flip-flop synchronizer in the destination clock domain to safely resolve metastability.

Multi-bit data buses:

Use handshake protocols (valid/ack) or asynchronous FIFOs to safely transfer data.

💡 Rule of Thumb:

1 flip-flop in the source domain → remove glitches.

2 flip-flops in the destination domain → handle metastability.

This simple approach ensures robust, predictable behavior when crossing clocks, and is a standard best practice in FPGA and ASIC designs.
