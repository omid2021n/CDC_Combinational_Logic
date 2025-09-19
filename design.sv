module cdc_demo(
    input  wire clkA,
    input  wire clkB,
    input  wire a,
    input  wire b,
    input  wire c,
    output wire sigB   // synchronized signal in clkB domain
);

// ---------------------------
// Step 1: Register combinational logic in clkA domain (source domain)
// ---------------------------
reg sigA_reg;

// combinational logic
wire comb_logic_A;
assign comb_logic_A = a & b | c;

always @(posedge clkA) begin
    sigA_reg <= comb_logic_A;  // remove glitches
end

// ---------------------------
// Step 2: Two-flop synchronizer in clkB domain (destination domain)
// ---------------------------
reg sync1, sync2;

always @(posedge clkB) begin
    sync1 <= sigA_reg;   // first flop, may go metastable
    sync2 <= sync1;      // second flop, safe output
end

assign sigB = sync2;     // final synchronized signal

endmodule
