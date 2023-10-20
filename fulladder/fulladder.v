module halfadder(a,b,cin,sum,cout);

    input wire a;
    input wire b;
    input wire cin;

    output wire sum;
    output wire cout;

    halfadder u_halfadder1(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    halfadder u_halfadder2(
        .a(s0),
        .b(cin),
        .cin(cin),
        .sum(sum_tb),
        .cout(cout_tb)
    );

    assign sum = s0 ^ cin;
    assign cout = c0 | c1 ;
endmodule