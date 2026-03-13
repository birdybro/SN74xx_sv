module sn7407_tb;
    logic [5:0] a;
    logic [5:0] y;
    logic [5:0] expected;
    int errors;

    sn7407 dut (.a(a), .y(y));

    initial begin
        errors = 0;
        for (int ai = 0; ai < 64; ai++) begin
            a = ai[5:0];
            #1;
            expected = a;
            if (y !== expected) begin
                $error("SN7407 mismatch: a=%b y=%b expected=%b", a, y, expected);
                errors++;
            end
        end
        if (errors != 0) $fatal(1, "SN7407 TB failed with %0d mismatches", errors);
        $display("SN7407 TB passed");
        $finish;
    end
endmodule
