module sn74157_tb;
    logic g_n;
    logic sel;
    logic [3:0] a;
    logic [3:0] b;
    logic [3:0] y;
    logic [3:0] expected;
    int errors;

    sn74157 dut (.g_n(g_n), .sel(sel), .a(a), .b(b), .y(y));

    function automatic logic [3:0] expected_mux(
        input logic fg_n,
        input logic fsel,
        input logic [3:0] fa,
        input logic [3:0] fb
    );
        begin
            if (fg_n) return 4'b0000;
            return fsel ? fb : fa;
        end
    endfunction

    initial begin
        errors = 0;
        for (int gi = 0; gi < 2; gi++) begin
            for (int si = 0; si < 2; si++) begin
                for (int ai = 0; ai < 16; ai++) begin
                    for (int bi = 0; bi < 16; bi++) begin
                        g_n = gi[0];
                        sel = si[0];
                        a = ai[3:0];
                        b = bi[3:0];
                        #1;
                        expected = expected_mux(g_n, sel, a, b);
                        if (y !== expected) begin
                            $error("SN74157 mismatch: g_n=%b sel=%b a=%b b=%b y=%b expected=%b", g_n, sel, a, b, y, expected);
                            errors++;
                        end
                    end
                end
            end
        end

        if (errors != 0) $fatal(1, "SN74157 TB failed with %0d mismatches", errors);
        $display("SN74157 TB passed");
        $finish;
    end
endmodule
