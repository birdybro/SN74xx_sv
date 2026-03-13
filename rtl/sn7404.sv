module sn7404 (
    input  logic [5:0] a,
    output logic [5:0] y
);
    assign y = ~a;
endmodule
