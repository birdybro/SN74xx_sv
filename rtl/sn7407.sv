module sn7407 (
    input  logic [5:0] a,
    output logic [5:0] y
);
    // Open-collector electrical behavior is abstracted to logic-level buffering.
    assign y = a;
endmodule
