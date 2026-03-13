module sn74153 (
    input  logic [1:0] g_n,
    input  logic [1:0] sel,
    input  logic [1:0] i0,
    input  logic [1:0] i1,
    input  logic [1:0] i2,
    input  logic [1:0] i3,
    output logic [1:0] y
);
    always_comb begin
        y = 2'b00;
        for (int ch = 0; ch < 2; ch++) begin
            if (!g_n[ch]) begin
                unique case (sel)
                    2'b00: y[ch] = i0[ch];
                    2'b01: y[ch] = i1[ch];
                    2'b10: y[ch] = i2[ch];
                    default: y[ch] = i3[ch];
                endcase
            end
        end
    end
endmodule
