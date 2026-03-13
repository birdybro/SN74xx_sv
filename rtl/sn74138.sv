module sn74138 (
    input  logic       g1,
    input  logic       g2a_n,
    input  logic       g2b_n,
    input  logic [2:0] sel,
    output logic [7:0] y_n
);
    always_comb begin
        y_n = 8'hFF;
        if (g1 && !g2a_n && !g2b_n) begin
            y_n[sel] = 1'b0;
        end
    end
endmodule
