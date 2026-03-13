module sn7432_tb;
    logic [3:0] a;
    logic [3:0] b;
    logic [3:0] y;
    logic [3:0] expected;
    int errors;

    sn7432 dut (.a(a), .b(b), .y(y));

    initial begin
        errors = 0;
        for (int ai = 0; ai < 16; ai++) begin
            for (int bi = 0; bi < 16; bi++) begin
                a = ai[3:0];
                b = bi[3:0];
                #1;
                expected = a | b;
                if (y !== expected) begin
                    $error("SN7432 mismatch: a=%b b=%b y=%b expected=%b", a, b, y, expected);
                    errors++;
                end
            end
        end
        if (errors != 0) $fatal(1, "SN7432 TB failed with %0d mismatches", errors);
        $display("SN7432 TB passed");
        $finish;
    end
endmodule
