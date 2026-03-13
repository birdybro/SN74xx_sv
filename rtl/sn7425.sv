module sn7425 (
    input  logic [1:0] a,
    input  logic [1:0] b,
    input  logic [1:0] c,
    input  logic [1:0] d,
    input  logic [1:0] s,
    output logic [1:0] y
);
    assign y = ~(a | b | c | d | s);
endmodule
