
#ifndef __SIMPLE_HW__
#define __SIMPLE_HW__

#include<systemc>

using namespace sc_core;

// hardware component module
SC_MODULE(HW)
{
    sc_out<int> out_port;  // data transmitting port
    int TXD;

    SC_CTOR(HW)
    {
        // process declaration
        SC_METHOD(hw_gen);
    }

    void hw_gen(void)
    {
        TXD = rand() % 10;
        out_port->write(TXD);
        std::cout << sc_time_stamp() << " HW: " << TXD << std::endl;
        // next run @ random usec time
        next_trigger((1 + rand() % 5), SC_US);
    }
};

#endif  // __SIMPLE_HW__
