module sn7413_tb;
    logic [1:0] a;
    logic [1:0] b;
    logic [1:0] c;
    logic [1:0] d;
    logic [1:0] y;
    logic [1:0] expected;
    int errors;

    sn7413 dut (.a(a), .b(b), .c(c), .d(d), .y(y));

    initial begin
        errors = 0;
        for (int ai = 0; ai < 4; ai++) begin
            for (int bi = 0; bi < 4; bi++) begin
                for (int ci = 0; ci < 4; ci++) begin
                    for (int di = 0; di < 4; di++) begin
                        a = ai[1:0];
                        b = bi[1:0];
                        c = ci[1:0];
                        d = di[1:0];
                        #1;
                        expected = ~(a & b & c & d);
                        if (y !== expected) begin
                            $error("SN7413 mismatch: a=%b b=%b c=%b d=%b y=%b expected=%b", a, b, c, d, y, expected);
                            errors++;
                        end
                    end
                end
            end
        end
        if (errors != 0) $fatal(1, "SN7413 TB failed with %0d mismatches", errors);
        $display("SN7413 TB passed");
        $finish;
    end
endmodule
