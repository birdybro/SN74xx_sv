module sn7405 (
    input  logic [5:0] a,
    output logic [5:0] y
);
    // Open-collector electrical behavior is abstracted to logic-level inversion.
    assign y = ~a;
endmodule
