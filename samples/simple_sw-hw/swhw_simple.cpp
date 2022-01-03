
#include "hw.h"
#include "sw.h"

int sc_main(int sc_argc, char* sc_argv[])
{
    sc_signal<int> sig;

    HW hw_i("HW_module");
    SW sw_i("SW_module");

    hw_i.out_port(sig);
    sw_i.in_port(sig);

    sc_start(100, SC_US);

    return(0);
}
