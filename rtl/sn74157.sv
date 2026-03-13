module sn74157 (
    input  logic       g_n,
    input  logic       sel,
    input  logic [3:0] a,
    input  logic [3:0] b,
    output logic [3:0] y
);
    always_comb begin
        if (g_n) begin
            y = 4'b0000;
        end else begin
            y = sel ? b : a;
        end
    end
endmodule
