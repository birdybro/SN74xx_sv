module sn74153_tb;
    logic [1:0] g_n;
    logic [1:0] sel;
    logic [1:0] i0;
    logic [1:0] i1;
    logic [1:0] i2;
    logic [1:0] i3;
    logic [1:0] y;
    logic [1:0] expected;
    int errors;

    sn74153 dut (.g_n(g_n), .sel(sel), .i0(i0), .i1(i1), .i2(i2), .i3(i3), .y(y));

    function automatic logic [1:0] expected_mux(
        input logic [1:0] fg_n,
        input logic [1:0] fsel,
        input logic [1:0] fi0,
        input logic [1:0] fi1,
        input logic [1:0] fi2,
        input logic [1:0] fi3
    );
        logic [1:0] t;
        begin
            t = 2'b00;
            for (int ch = 0; ch < 2; ch++) begin
                if (!fg_n[ch]) begin
                    case (fsel)
                        2'b00: t[ch] = fi0[ch];
                        2'b01: t[ch] = fi1[ch];
                        2'b10: t[ch] = fi2[ch];
                        default: t[ch] = fi3[ch];
                    endcase
                end
            end
            return t;
        end
    endfunction

    initial begin
        errors = 0;
        for (int gi = 0; gi < 4; gi++) begin
            for (int si = 0; si < 4; si++) begin
                for (int i0i = 0; i0i < 4; i0i++) begin
                    for (int i1i = 0; i1i < 4; i1i++) begin
                        for (int i2i = 0; i2i < 4; i2i++) begin
                            for (int i3i = 0; i3i < 4; i3i++) begin
                                g_n = gi[1:0];
                                sel = si[1:0];
                                i0 = i0i[1:0];
                                i1 = i1i[1:0];
                                i2 = i2i[1:0];
                                i3 = i3i[1:0];
                                #1;
                                expected = expected_mux(g_n, sel, i0, i1, i2, i3);
                                if (y !== expected) begin
                                    $error("SN74153 mismatch: g_n=%b sel=%b i0=%b i1=%b i2=%b i3=%b y=%b expected=%b",
                                           g_n, sel, i0, i1, i2, i3, y, expected);
                                    errors++;
                                end
                            end
                        end
                    end
                end
            end
        end

        if (errors != 0) $fatal(1, "SN74153 TB failed with %0d mismatches", errors);
        $display("SN74153 TB passed");
        $finish;
    end
endmodule
