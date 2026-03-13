module sn7403 (
    input  logic [3:0] a,
    input  logic [3:0] b,
    output logic [3:0] y
);
    // Open-collector electrical behavior is abstracted to logic-level NAND output.
    assign y = ~(a & b);
endmodule
