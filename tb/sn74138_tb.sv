module sn74138_tb;
    logic g1;
    logic g2a_n;
    logic g2b_n;
    logic [2:0] sel;
    logic [7:0] y_n;
    logic [7:0] expected;
    int errors;

    sn74138 dut (.g1(g1), .g2a_n(g2a_n), .g2b_n(g2b_n), .sel(sel), .y_n(y_n));

    function automatic logic [7:0] expected_decode(
        input logic fg1,
        input logic fg2a_n,
        input logic fg2b_n,
        input logic [2:0] fsel
    );
        logic [7:0] t;
        begin
            t = 8'hFF;
            if (fg1 && !fg2a_n && !fg2b_n) t[fsel] = 1'b0;
            return t;
        end
    endfunction

    initial begin
        errors = 0;
        for (int g1i = 0; g1i < 2; g1i++) begin
            for (int g2ai = 0; g2ai < 2; g2ai++) begin
                for (int g2bi = 0; g2bi < 2; g2bi++) begin
                    for (int si = 0; si < 8; si++) begin
                        g1 = g1i[0];
                        g2a_n = g2ai[0];
                        g2b_n = g2bi[0];
                        sel = si[2:0];
                        #1;
                        expected = expected_decode(g1, g2a_n, g2b_n, sel);
                        if (y_n !== expected) begin
                            $error("SN74138 mismatch: g1=%b g2a_n=%b g2b_n=%b sel=%0d y_n=%b expected=%b",
                                   g1, g2a_n, g2b_n, sel, y_n, expected);
                            errors++;
                        end
                    end
                end
            end
        end

        if (errors != 0) $fatal(1, "SN74138 TB failed with %0d mismatches", errors);
        $display("SN74138 TB passed");
        $finish;
    end
endmodule
