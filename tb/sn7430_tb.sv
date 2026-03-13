module sn7430_tb;
    logic [7:0] a;
    logic y;
    logic expected;
    int errors;

    sn7430 dut (.a(a), .y(y));

    initial begin
        errors = 0;
        for (int ai = 0; ai < 256; ai++) begin
            a = ai[7:0];
            #1;
            expected = ~(&a);
            if (y !== expected) begin
                $error("SN7430 mismatch: a=%b y=%b expected=%b", a, y, expected);
                errors++;
            end
        end
        if (errors != 0) $fatal(1, "SN7430 TB failed with %0d mismatches", errors);
        $display("SN7430 TB passed");
        $finish;
    end
endmodule
