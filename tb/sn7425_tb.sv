module sn7425_tb;
    logic [1:0] a;
    logic [1:0] b;
    logic [1:0] c;
    logic [1:0] d;
    logic [1:0] s;
    logic [1:0] y;
    logic [1:0] expected;
    int errors;

    sn7425 dut (.a(a), .b(b), .c(c), .d(d), .s(s), .y(y));

    initial begin
        errors = 0;
        for (int ai = 0; ai < 4; ai++) begin
            for (int bi = 0; bi < 4; bi++) begin
                for (int ci = 0; ci < 4; ci++) begin
                    for (int di = 0; di < 4; di++) begin
                        for (int si = 0; si < 4; si++) begin
                            a = ai[1:0];
                            b = bi[1:0];
                            c = ci[1:0];
                            d = di[1:0];
                            s = si[1:0];
                            #1;
                            expected = ~(a | b | c | d | s);
                            if (y !== expected) begin
                                $error("SN7425 mismatch: a=%b b=%b c=%b d=%b s=%b y=%b expected=%b", a, b, c, d, s, y, expected);
                                errors++;
                            end
                        end
                    end
                end
            end
        end
        if (errors != 0) $fatal(1, "SN7425 TB failed with %0d mismatches", errors);
        $display("SN7425 TB passed");
        $finish;
    end
endmodule
