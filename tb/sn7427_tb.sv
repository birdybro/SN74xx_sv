module sn7427_tb;
    logic [2:0] a;
    logic [2:0] b;
    logic [2:0] c;
    logic [2:0] y;
    logic [2:0] expected;
    int errors;

    sn7427 dut (.a(a), .b(b), .c(c), .y(y));

    initial begin
        errors = 0;
        for (int ai = 0; ai < 8; ai++) begin
            for (int bi = 0; bi < 8; bi++) begin
                for (int ci = 0; ci < 8; ci++) begin
                    a = ai[2:0];
                    b = bi[2:0];
                    c = ci[2:0];
                    #1;
                    expected = ~(a | b | c);
                    if (y !== expected) begin
                        $error("SN7427 mismatch: a=%b b=%b c=%b y=%b expected=%b", a, b, c, y, expected);
                        errors++;
                    end
                end
            end
        end
        if (errors != 0) $fatal(1, "SN7427 TB failed with %0d mismatches", errors);
        $display("SN7427 TB passed");
        $finish;
    end
endmodule
