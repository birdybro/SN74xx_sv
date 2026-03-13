module sn7414 (
    input  logic [5:0] a,
    output logic [5:0] y
);
    assign y = ~a;
endmodule
